class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
    has_many :cleans, dependent: :destroy
    validates :name, presence: true
    validates :profile, length: { maximum: 200 }
    has_many :cleans, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_cleans, through: :likes, source: :clean
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
  def already_liked?(clean)
    self.likes.exists?(clean_id: clean.id)
  end
end
