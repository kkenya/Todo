class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :speacks
  has_one :image, class_name: "user_images", dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: false
  validates :password, presence: { on: :create }, confirmation: { allow_blank: true }

  attr_accessor :password, :password_confirmation

  #bcrypt-railsによるパスワードの暗号化のためのアクセサメソッド
  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end

  class << self
    def search(query)
      rel = order("name")
      if query.present?
        rel = rel.where("name LIKE ?", "%#{query}%")
      end
      rel
    end

    def authenticate(name, password)
      user = find_by(name: name)
      if user && user.hashed_password.present? && BCrypt::Password.new(user.hashed_password) == password
        user
      else
        nil
      end
    end
  end
end
