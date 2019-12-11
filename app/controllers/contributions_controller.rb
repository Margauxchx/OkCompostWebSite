# frozen_string_literal: true

class ContributionsController < ApplicationController

  include ContributionsHelper
  before_action :authenticate_user!
  before_action :set_compost, except: [:new]
  before_action :set_contribution, except: [:new, :create]

    def new
        @contribution = Contribution.new
        @compost = Compost.find(params[:id])
    end 

    def create
        @contribution = Contribution.new(
            contributor_id: params[:contributor_id], 
            supplied_compost_id: params[:supplied_compost_id],
            contribution_date: params[:contribution_date],
            message: params[:message],
            
            status: "submitted"
        )
        if @contribution.save!
            flash[:success] = "Ta demande contribution a bien été prise en compte"
            redirect_to compost_path(@compost)
        else
            flash[:danger] = "La contribution n'a pas pu être créée"
            render root_path
        end 
    end

  def update
    case contribution_params[:status_action]
    when 'accept'
      accept_contribution
    when 'reject'
      reject_contribution
    end
    redirect_to compost_path(@compost)
  end

    def accept
        @contribution = Contribution.find(params[:contribution_id])
        @compost = @contribution.supplied_compost
        @contribution.accepted!
        @compost.filling += contribution_default_quantity
        @compost.save!
        flash[:success] = "La contribution a bien été acceptée"
        redirect_to compost_path(@compost.id)
      UserMailer.valid_contribution_email(@contribution).deliver_now
    end 

    def reject
        @contribution = Contribution.find(params[:contribution_id])
        @compost = @contribution.supplied_compost 
        @contribution.rejected!
        flash[:alert] = "La contribution a été refusée"
        redirect_to compost_path(@compost.id)
       UserMailer.reject_contribution_email(@contribution).deliver_now
    end 

  private

  def contribution_params
    params.require(:contribution).permit(
      :status_action
    )
  end


  def set_compost
    @compost = Compost.find(params[:compost_id])
  end

  def set_contribution
    @contribution = Contribution.find(params[:id])
  end

  def authenticate_user
    unless current_user
      flash[:error] = 'Merci de te connecter afin de pouvoir contribuer à ce compost'
      redirect_to new_user_session_path
    end
  end

  def accept_contribution
    @contribution.accepted!
    @compost.filling += contribution_default_quantity
    @compost.save!
    flash[:success] = 'La contribution a été acceptée.'
  end

  def reject_contribution
    @contribution.rejected!
    flash[:alert] = 'La contribution a été refusée.'
  end
end
