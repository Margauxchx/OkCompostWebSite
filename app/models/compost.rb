class Compost < ApplicationRecord
validates :title,
  presence: { message: "ne peut pas être vide"},
  length: { in: 3..30, message: "a une longueur inappropriée" }
validates :address, presence: { message: "ne peut pas être vide"}
validates :zipcode, 
  presence: { message: "ne peut pas être vide"},
  inclusion: { in: ["75001", "75002", "75003", "75004", "75005", "75006", "75007", "75008", "75009", "75010", "75011", "75012", "75013", "75014", "75015", "75016", "75017", "75018", "75019", "75020"], message: "est invalide, il doit correspondre à un arrondissement parisien" }
validates :description,
  presence: { message: "ne peut pas être vide"},
  length: { maximum: 160, message: "a une longueur inappropriée" }

  acts_as_taggable_on :districts, :compositions

  # N - 1 association with composters (users)
  belongs_to :composter, class_name: 'User'

  # 1 - N association with contributions, as supplied_compost
  has_many :contributions, foreign_key: 'supplied_compost_id'
  # N - N association with contributors (users), via contributions
  has_many :contributors, through: :contributions, source: :contributor

  # 1 - N association with result_lines
  has_many :result_lines
  # N - N association with results, via result_lines
  has_many :results, through: :result_lines

  # Active Storage picture association
  has_one_attached :picture

  # use user input to create/update district tag
  before_save :tag_with_district
  before_save :update_is_open

  #geocoder 
  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    return self.address + " " + self.zipcode + " " + self.city + ", " + self.country
  end 

  private

  def tag_with_district
    self.district_list = self.zipcode
  end

  def update_is_open
    if self.filling && self.filling >= 100
      self.is_open = false
    end
  end

  
end
