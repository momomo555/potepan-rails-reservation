class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  validates :start, presence: true
  validates :end, presence: true
  validates :number_of_people, presence: true, numericality: {only_integer: true,   greater_than: 0}
  validate :day_before_today, :start_before_end

  def day_before_today
    if !self.start.nil?
      if self.start < Date.today
        errors.add(:start, 'は、本日以降の日付を入力してください')
      end
    end
    if !self.end.nil?
      if self.end < Date.today  
        errors.add(:end, 'は、本日以降の日付を入力してください')
      end
    end
  end

  def start_before_end
    if !self.start.nil? && !self.end.nil?
      if self.start >= self.end
        errors.add(:start, 'は、終了日以前の日付を入力してください')
      end
    end
  end

end
