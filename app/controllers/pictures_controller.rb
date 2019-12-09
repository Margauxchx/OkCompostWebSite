class PicturesController < ApplicationController
  def create
    @compost = Compost.find(params[:compost_id])
    @compost.picture.attach(params[:picture])
    redirect_to(compost_path(@compost))
  end
end
