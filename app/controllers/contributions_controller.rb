class ContributionsController < ApplicationController
    include ContributionsHelper
    before_action :authenticate_user!
    before_action :set_compost, only: [:create]
    def new
        @contribution = Contribution.new
        @compost = Compost.find(params[:id])
    end 

    def create
        @contribution = Contribution.new(
            contributor_id: params[:contributor_id], 
            supplied_compost_id: params[:supplied_compost_id],
            status: "submitted"
        )
        if @contribution.save!
            @compost.filling += contribution_default_quantity
            @compost.save!
            flash[:success] = "Ta demande contribution a bien été prise en compte"
            redirect_to compost_path(@compost)
        else
            flash[:danger] = "La contribution n'a pas pu être créée n'a pas pu être créé"
            render root_path
        end 
    end

    private

    def set_compost
        @compost = Compost.find(params[:supplied_compost_id])
    end 
end
