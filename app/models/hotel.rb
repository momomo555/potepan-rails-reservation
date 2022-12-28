class Hotel < ApplicationRecord
  has_one_attached :image
  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :user, foreign_key: 'owner_id'
  validates :name, presence: true
  validates :comment, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :image, presence: true
end
