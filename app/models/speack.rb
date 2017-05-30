class Speack < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :comment, length: { minimum: 2, maximum: 30 }
end
