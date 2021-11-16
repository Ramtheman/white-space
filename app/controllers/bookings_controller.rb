class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(space_id: params(:space_id))
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.space = Space.find(params(:space_id))
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
