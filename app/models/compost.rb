class Compost < ApplicationRecord
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

  private

  def tag_with_district
    self.district_list = self.zipcode
  end
end
