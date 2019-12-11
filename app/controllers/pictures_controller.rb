class PicturesController < ApplicationController

  before_action :authenticate_user

  def create
    @compost = Compost.find(params[:compost_id])
    @compost.picture.attach(params[:picture])
    redirect_to(compost_path(@compost))
  end

  private

  def authenticate_user
    unless current_user
      flash[:error] = "Merci de te connecter afin de pouvoir modifier l'image de ce compost."
      redirect_to new_user_session_path
    end
  end

end
