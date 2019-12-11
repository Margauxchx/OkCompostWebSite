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
end
