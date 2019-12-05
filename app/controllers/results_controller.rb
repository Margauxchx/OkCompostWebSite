class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET /results
  def index
    @results = Result.all
  end

  # GET /results/1
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  def create
    @result = Result.new(result_params)

    if @result.district.empty? && @result.composition.empty?
      flash.now[:error] = "Merci de sélectionner au moins un critère de recherche.\n
      Pour voir tous les composts, rendez-vous sur la page #{view_context.link_to('tous les composts', composts_path)}"
      render :new
      return
    end

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Voici les résultats de votre recherche :' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /results/1
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /results/1
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    def search_must_have_params

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(
        :district , :composition => []
      )
    end
end
