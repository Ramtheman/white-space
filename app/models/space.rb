class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, :type, :price, presence: true
end
