class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :name, presence: true,
    length: { minimum: 2, maximum: 20 },
    uniqueness: false

  class << self
    def search(query)
      rel = order("name")
      if query.present?
        rel = rel.where("name LIKE ?", "%#{query}%")
      end
      rel
    end
  end
end
