class Result < ApplicationRecord
  enum search_mode: [:normal, :strict, :cool]

  # N -1 association with users
  belongs_to :user, optional: true

  # 1 - N association with result_lines
  has_many :result_lines
  # N - N association with composts, via result_lines
  has_many :composts, through: :result_lines

  before_create :search
  after_create :save_lines

  def search_by_district
    composts = Compost.tagged_with(self.district)
    composts.each do |compost|
      self.result_lines.new(compost_id: compost.id)
    end
  end

  def search_by_composition
    case self.search_mode
    when 'strict'
      composts = Compost.tagged_with(self.composition, :on => :compositions, :match_all => true)
    when 'cool'
      composts = Compost.tagged_with(self.composition, :on => :compositions, :any => true)
    else
      composts = Compost.tagged_with(self.composition)
    end

    composts.each do |compost|
      self.result_lines.new(compost_id: compost.id) if compost.is_open
    end
  end

  def search_by_both
    district_composts = Compost.tagged_with(self.district)
    case self.search_mode
    when 'strict'
      composts = district_composts.tagged_with(self.composition, :on => :compositions, :match_all => true)
    when 'cool'
      composts = district_composts.tagged_with(self.composition, :on => :compositions, :any => true)
    else
      composts = district_composts.tagged_with(self.composition)
    end
    composts.each do |compost|
      self.result_lines.new(compost_id: compost.id)
    end
  end

  private

  def search
    if !self.district.empty? && self.composition.empty?
      self.search_by_district
    elsif self.district.empty? && self.composition.any?
      self.search_by_composition
    elsif !self.district.empty? && self.composition.any?
      self.search_by_both
    end
  end

  def save_lines
    self.result_lines.each do |result_line|
      result_line.save!()
    end
  end
end
