class Task < ApplicationRecord
  belongs_to :user

  STATUS_VALUES = %w(today week month)

  validates :title, :status, presence: true
  validates :title, length: { maximum: 50 }
  validates :memo, length: { maximum: 200 }
  validates :status, inclusion: { in: STATUS_VALUES }

  scope :daily, -> { where("status = ? and created_at >= ? and created_at <= ?", "today", Time.current.beginning_of_day, Time.current.end_of_day) }
  scope :weekly, -> { where("status = ? and created_at >= ? and created_at <= ?", "week", Time.current.beginning_of_week, Time.current.end_of_week) }
  scope :monthly, -> { where("status = ? and created_at >= ?and created_at <= ?", "month", Time.current.beginning_of_month, Time.current.end_of_month) }

  class << self
    def status_text(status)
      I18n.t("activerecord.attributes.task.status_#{status}")
    end

    def status_options
      STATUS_VALUES.map { |status| [status_text(status), status] }
    end
  end

  def created_by?(user)
    return false unless user
    user_id == user.id
  end
end
