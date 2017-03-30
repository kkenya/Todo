class Task < ApplicationRecord
  belongs_to :user

  STATUS_VALUES = %w(today week month)

  validates :title, :status, presence: true
  validates :title, length: { maximum: 100 }
  validates :memo, length: { maximum: 200 }
  validates :status, inclusion: { in: STATUS_VALUES }

  scope :daily, -> { where(status: "today") }
  scope :weekly, -> { where(status: "week") }
  scope :monthly, -> { where(status: "month") }

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

  private
  def check_expired_at
    if released_at >= expired_at
      errors.add(:expired_at, :expired_at_too_old)
    end
  end
end
