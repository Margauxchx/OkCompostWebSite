class Contribution < ApplicationRecord
  after_create :ask_contribution_send
  
  def ask_contribution_send
    UserMailer.ask_contribution_email(self).deliver_now
  end
  
  enum status: [:submitted, :accepted, :rejected]
  # N - 1 association with contributors (users)
  belongs_to :contributor, class_name: 'User'
  # N - 1 association with supplied_composts (composts)
  belongs_to :supplied_compost, class_name: 'Compost'

  after_create :send_message_to_compost_owner

  private

  def send_message_to_compost_owner
  	@sender_id = self.contributor_id
  	@recipient_id = Compost.find(self.supplied_compost_id).composter_id
  	if Conversation.between(@sender_id, @recipient_id).present?
  	  @conversation = Conversation.between(@sender_id, @recipient_id).first
  	else
  	  @conversation = Conversation.create!(sender_id: @sender_id, recipient_id: @recipient_id)
  	end
  	Message.create!(conversation_id: @conversation.id, user_id: @sender_id, body: "Date de conribution souhaitée : " +  self.contribution_date.to_s + " " + self.message)
  end
end
