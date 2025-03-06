class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  has_one :feedback, dependent: :destroy
end
