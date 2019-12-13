class CompostsController < ApplicationController
  include UsersHelper
  
  before_action :authenticate_user, except: [:show, :index]
  before_action :set_compost, except: [:new, :create, :index]
  before_action :has_access?, except: [:new, :create, :show, :index]
  before_action :profile_enhancement, only: [:index]

  # GET /composts
  def index
    @composts = Compost.all
  end

  # GET /composts/1
  def show
    @contributions = @compost.contributions
    @slots = @compost.timeslots.order(:weekday, :start_time)
  end

  # GET /composts/new
  def new
    @compost = Compost.new
  end

  # GET /composts/1/edit
  def edit
  end

  # POST /composts
  def create
    @compost = current_user.owned_composts.new(compost_params)
    @compost.city = "Paris"
    @compost.country = "France"
    
    if @compost.save
      redirect_to @compost, notice: 'Le compost a bien été créé.' 
    else
      render :new
    end
  end

  # PATCH/PUT /composts/1
  def update
    respond_to do |format|
      if @compost.update(compost_params)
        @compost.composition_list = compost_params[:composition_list]
        @compost.picture.attach(params[:picture]) if params[:picture]
        @compost.save()
        format.html { redirect_to @compost, notice: 'Le compost a été mis à jour.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /composts/1
  def destroy
    @compost.destroy
    respond_to do |format|
      format.html { redirect_to composts_url, notice: 'Le compost a été détruit.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compost
      @compost = Compost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compost_params
      params.require(:compost).permit(
        :title, :address, :zipcode, :city,
        :country, :description, :access_data,
        :image_url, :is_open, :filling,
        :picture,
        :composition_list => []
      )
    end

    # Method to ask the user to add more data to his profile on the welcome page ==> to move when we have the final welcome page
    def profile_enhancement
      if profile_completed?(50) == false
          flash.now[:notice] = "Votre profil n'est rempli qu'à #{current_user.profile_completion}%. A l'occasion, passez le compléter #{view_context.link_to('par ici', edit_user_path(current_user))}"      
      end
    end

  def authenticate_user
    unless current_user
      flash[:error] = "Merci de te connecter afin de voir cette page."
      redirect_back(fallback_location: root_path)
    end
  end

  def has_access?
    unless current_user && is_owner?(@compost)
      flash[:error] = "Cette action est réservée au propriétaire de ce compost."
      redirect_back(fallback_location: compost_path(@compost))
    end
  end
end
