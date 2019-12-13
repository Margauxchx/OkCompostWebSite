class Timeslot < ApplicationRecord
  # N- 1 association with compost
  belongs_to :compost

  validates :weekday, presence: true,
  numericality: { only_integer: true },
  inclusion: { in: 1..7 }

  validates :start_time, presence: true,
  length: { is: 4 },
  format: { with: //, message: "l'heure de début doit être au format HH:MM" }

  validates :end_time, presence: true,
  length: { is: 4 },
  format: { with: //, message: "l'heure de fin doit être au format HH:MM" }

  validate :end_later_than_starts

  before_validation :convert_times

  def nice_day
    case self.weekday
    when 1
      "Lundi"
    when 2
      "Mardi"
    when 3
      "Mercredi"
    when 4
      "Jeudi"
    when 5
      "Vendredi"
    when 6
      "Samedi"
    when 7
      "Dimanche"
    end
  end

  def nice_slot
    "#{nice_start_time} à #{nice_end_time}"
  end

  private

  def convert_times
    self.start_time.delete!(':') if self.start_time
    self.end_time.delete!(':') if self.end_time
  end

  def end_later_than_starts
    errors.add(:end_time, "doit se terminer après l'heure de début") if (start_time && end_time && end_time <= start_time)
  end

  def nice_time(time)
    time.slice(0..1) + 'h' + time.slice(2..3)
  end

  def nice_start_time
    nice_time(self.start_time)
  end

  def nice_end_time
    nice_time(self.end_time)
  end
end
