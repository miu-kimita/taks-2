class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image, destroy: false
  validates :name, length: { minimum: 2, maximum: 20 }
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :introduction, length: { maximum: 50 }
end
