class ResultsController < ApplicationController
  before_action :set_result, only: [:show]
  before_action :search_must_have_params, only: [:create]

  # GET /results/1
  def show
  end

  # GET /results/new
  def new
    @result = Result.new

    @compost1 = Compost.all.sample
    @user1 = User.find(@compost1.composter_id)
    @compost2 = Compost.all.sample
    @user2 = User.find(@compost2.composter_id)
  end

  # POST /results
  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Voici les résultats de votre recherche :' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # forbid empty search
    def search_must_have_params
      if result_params[:district].empty? && result_params[:composition] == nil
        flash[:error] = "Merci de sélectionner au moins un critère de recherche.\n
        Pour voir tous les composts, rendez-vous sur la page #{view_context.link_to('tous les composts', composts_path)}"
        redirect_back(fallback_location: root_path)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(
        :district , :composition => []
      )
    end
end
