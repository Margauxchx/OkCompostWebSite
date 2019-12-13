class ApplicationController < ActionController::Base
    include ApplicationHelper
    before_action :configure_devise_permitted_parameters, if: :devise_controller?
    before_action :unread_messages

    def unread_messages
      if current_user 
        @conversations_sender = Conversation.where(sender_id: current_user.id)
        @conversations_recipient = Conversation.where(recipient_id: current_user.id)
        @conversations = (@conversations_sender + @conversations_recipient)
        @unread_conversations = @conversations.find_all do |conversation| 
          if conversation.messages.last
            conversation.messages.last["read"] == false && conversation.messages.last.user_id != current_user.id 
          end
        end
      end
    end

    protected

    def configure_devise_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation)}
    end
end
