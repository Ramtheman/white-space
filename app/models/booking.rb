class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validate :start_date, :end_date, presence: true
end
