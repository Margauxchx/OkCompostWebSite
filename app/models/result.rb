class Result < ApplicationRecord
  # N -1 association with users
  belongs_to :user, optional: true

  # 1 - N association with result_lines
  has_many :result_lines
  # N - N association with composts, via result_lines
  has_many :composts, through: :result_lines

  before_create :search_by_district, :search_by_composition
  after_create :save_lines

  private

  def search_by_district
    district = self.district
    composts = Compost.tagged_with(district)
    composts.each do |compost|
      self.result_lines.new(compost_id: compost.id)
    end
  end

  def search_by_composition
    composition = self.composition
    composts = Compost.tagged_with(composition)
    composts.each do |compost|
      self.result_lines.new(compost_id: compost.id)
    end
  end

  def save_lines
    self.result_lines.each do |result_line|
      result_line.save!()
    end
  end
end
