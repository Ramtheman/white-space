class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, :space_type, :price, presence: true
end
