class CompostsController < ApplicationController
  include UsersHelper
  before_action :set_compost, only: [:show, :edit, :update, :destroy]
  before_action :profile_enhencement, only: [:index]

  # GET /composts
  # GET /composts.json
  def index
    @composts = Compost.all
  end

  # GET /composts/1
  # GET /composts/1.json
  def show
    @contributions = @compost.contributions
  end

  # GET /composts/new
  def new
    @compost = Compost.new
  end

  # GET /composts/1/edit
  def edit
  end

  # POST /composts
  # POST /composts.json
  def create
    @compost = Compost.new(compost_params)

    respond_to do |format|
      if @compost.save
        format.html { redirect_to @compost, notice: 'Compost was successfully created.' }
        format.json { render :show, status: :created, location: @compost }
      else
        format.html { render :new }
        format.json { render json: @compost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /composts/1
  # PATCH/PUT /composts/1.json
  def update
    respond_to do |format|
      if @compost.update(compost_params)
        format.html { redirect_to @compost, notice: 'Compost was successfully updated.' }
        format.json { render :show, status: :ok, location: @compost }
      else
        format.html { render :edit }
        format.json { render json: @compost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /composts/1
  # DELETE /composts/1.json
  def destroy
    @compost.destroy
    respond_to do |format|
      format.html { redirect_to composts_url, notice: 'Compost was successfully destroyed.' }
      format.json { head :no_content }
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
        :district_list, :composition_list
      )
    end

    # Method to ask the user to add more data to his profile on the welcome page ==> to move when we have the final welcome page
    def profile_enhencement
      if profile_completed?(50) == false
          flash.now[:notice] = "Votre profil n'est rempli qu'à #{current_user.profile_completion}%. A l'occasion, passez le compléter #{view_context.link_to('par ici', edit_user_path(current_user))}"      
      end
    end
end
