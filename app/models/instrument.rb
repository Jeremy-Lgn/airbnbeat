class Instrument < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many_attached :photos


  validates :title, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true


end
