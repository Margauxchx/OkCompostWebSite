class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :edit]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @composts = @user.owned_composts
    @contributions = @user.contributions
    @conversations_sender = Conversation.where(sender_id: current_user.id)
    @conversations_recipient = Conversation.where(recipient_id: current_user.id)
    @conversations = (@conversations_sender + @conversations_recipient)
    @unread_conversations = @conversations.find_all do |conversation| 
      if conversation.messages.last
        conversation.messages.last["read"] == false && conversation.messages.last.user_id != current_user.id 
      end
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    current_user_must_own_profile
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "Votre compote a bien été crée, bienvenue !" }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        @user.avatar.attach(params[:avatar]) if params[:avatar]
        @user.save()
        format.html { redirect_to @user, notice: 'Votre profil a été mis à jour.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Votre compte a bien été supprimé. On espère vous revoir bientôt :)' }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :firstname, :lastname, :username, :email,
        :address, :zipcode, :city, :country,
        :avatar_url, :is_composter, :avatar
      )
    end

    # Only owner of profil can edit it
    def current_user_must_own_profile
      if current_user.id != @user.id
        flash[:error] = "Vous n'avez pas accès à l'édition de ce profil"
        redirect_to user_path(@user.id)
      end
    end
end
