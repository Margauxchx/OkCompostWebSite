class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  # 1 - N association with owned_composts (composts), as composter
  has_many :owned_composts, class_name: 'Compost', foreign_key: 'composter_id'

  # 1 - N association with contributions, as contributor
  has_many :contributions, foreign_key: 'contributor_id'
  # N - N  association with supplied_composts (composts), via contributions
  has_many :supplied_composts, class_name: 'Compost', source: :supplied_compost
end
