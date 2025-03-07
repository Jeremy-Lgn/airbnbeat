class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument
  has_one :feedback, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true

  def total_price
    diff_days = end_date - start_date
    diff_days.to_i * instrument.price_per_day
  end
end
