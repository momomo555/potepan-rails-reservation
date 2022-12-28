class User < ApplicationRecord
  has_many :reservations
  has_many :hotels, through: :reservations
  has_many :hotels, foreign_key: 'owner_id'
  has_one_attached :image
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
