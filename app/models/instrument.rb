class Instrument < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_many_attached :photos


  validates :title, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
end
