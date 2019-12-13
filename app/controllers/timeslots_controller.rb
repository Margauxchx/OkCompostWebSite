class TimeslotsController < ApplicationController
  include UsersHelper

  before_action :authenticate_user
  before_action :set_compost
  before_action :has_access?
  before_action :set_timeslot, only: [:destroy]

  def create
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.compost_id = @compost.id
    if @timeslot.save
      redirect_to @compost, notice: 'Le créneau a bien été ajouté.'
    else
      flash[:error] = "Ce créneau n'a pas pu être validé."
      redirect_to @compost
    end
  end

  def destroy
    @timeslot.destroy
    redirect_to compost_path(@compost), notice: 'Le créneau a bien été supprimé.'
  end

  private

  def timeslot_params
    params.require(:timeslot).permit(
      :weekday, :start_time, :end_time
    )
  end

  def set_timeslot
    @timeslot = Timeslot.find(params[:id])
    puts @timeslot.id
  end

  def set_compost
    @compost = Compost.find(params[:compost_id])
  end

  def authenticate_user
    unless current_user
      flash[:error] = "Cette action est réservée à un·e untilisat·eur·rice connecté·e."
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
