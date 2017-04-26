class Speack < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :comment, length: { maximum: 30 }, allow_blank: true
end
