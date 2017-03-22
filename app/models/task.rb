class Task < ApplicationRecord
  belongs_to :user

  validates :title, :released_at, :expired_at, presence: true
  validates :title, length: { maximum: 100 }
  validates :memo, length: { maximum: 200 }
  validate :check_expired_at

  scope :today, -> {
    day_start = Time.current.beginning_of_day
    midnight = Time.current.beginning_of_day.advance(days: 1)
    where("released_at >= ? AND expired_at < ?", day_start ,midnight)
  }

  private
  def check_expired_at
    if expired_at.to_s < released_at.to_s
      errors.add(:expired_at, :expired_at_too_old)
    end
  end
end
