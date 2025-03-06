class Feedback < ApplicationRecord
  belongs_to :instrument
  belongs_to :user
end
