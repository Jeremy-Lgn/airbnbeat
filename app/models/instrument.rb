class Instrument < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many_attached :photos
end
