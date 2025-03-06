class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  has_many :feedback, dependent: :destroy
end
