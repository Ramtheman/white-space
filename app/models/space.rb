class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, :space_type, :price, :location, presence: true

  validates :space_type, inclusion: { in: ['Face paint', 'Bathroom stall', 'Tattoo', 'Manhole', 'Legal name', 'Oyster card'],
    message: "%{value} is not a valid space type" }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
