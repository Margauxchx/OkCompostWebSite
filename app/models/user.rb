class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: " valide, s'il vous plaît !"}
  validates :username,
    presence: true,
    uniqueness: true
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  # 1 - N association with owned_composts (composts), as composter
  has_many :owned_composts, class_name: 'Compost', foreign_key: 'composter_id'

  # 1 - N association with contributions, as contributor
  has_many :contributions, foreign_key: 'contributor_id'
  # N - N  association with supplied_composts (composts), via contributions
  has_many :supplied_composts, class_name: 'Compost', through: :contributions, source: :supplied_compost

  # 1 - N association with results
  has_many :results  

  def profile_completion
    profile_details = [self.email, self.username, self.firstname, self.lastname, self.address, self.zipcode, self.city, self.country]
    return profile_completion = ( 100*(1 - profile_details.count(nil).to_f/profile_details.length.to_f)).to_i
  end 
end
