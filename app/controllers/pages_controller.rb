class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @user = current_user
    @bookings = Booking.where("user_id = ?", params[:user_id])
  end

  def my_spaces
    @spaces = Space.where(user: current_user)
    @bookings = Booking.all

    space_ids = []
    @spaces.each do |space|
      space_ids << space.id
    end

    @my_bookings = @bookings.select do |booking|
      space_ids.include?(booking.space_id)
    end
  end
end
