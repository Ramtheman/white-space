class PagesController < ApplicationController
  def home
    @user = current_user
    @bookings = Booking.where("user_id = ?", params[:user_id])
  end

  def my_spaces
    @spaces = Space.where(user: current_user)
    @bookings = Booking.all

    # @my_bookings =
  end
end
