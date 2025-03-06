class Instrument < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_many_attached :photos


  validates :title, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true

  validates :photos, presence: true
  # validates :photos, content_type: ['image/png', 'image/jpg', 'image/jpeg'], limit: { min: 1, max: 5.megabytes

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [:title],
    using: {
      tsearch: { prefix: true }
    }
end
