class MessagesController < ApplicationController
	before_action :set_conversation
  before_action :current_user_must_be_sender_or_recipient, only: [:index]

  def index
  	@messages = @conversation.messages
  	if @messages.length > 10
  	  @over_ten = true
  	  @messages = @messages[-10..-1]
  	end
  	if params[:m]
  	  @over_ten = false
  	  @messages = @conversation.messages
  	end
  	if @messages.last
  	  if @messages.last.user_id != current_user.id
  	  	@messages.last.update(read: true)
  	  end
  	end

  	@message = @conversation.messages.new

  end

  def new
  	@message = @conversation.messages.new
  end

  def create
  	@message = @conversation.messages.new(message_params)
  	if @message.save
  	  redirect_to conversation_messages_path(@conversation)
  	end
  end

  private

  def message_params
  	params.require(:message).permit(:body, :user_id)
  end

  def set_conversation
  	@conversation = Conversation.find(params[:conversation_id])
  end

  def current_user_must_be_sender_or_recipient
    if current_user.id != @conversation.sender_id && current_user.id != @conversation.recipient_id
      flash[:error] = "Vous n'avez pas accès à cette conversation"
      redirect_to user_path(current_user.id)
    end
  end
end
