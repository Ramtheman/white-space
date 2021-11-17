class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :title, :space_type, :price, presence: true
  validates :space_type, inclusion: { in: ['Car sticker', 'Tattoo', 'Bagpack', 'Legal name change', 'Front lawn'],
    message: "%{value} is not a valid space type" }

end
