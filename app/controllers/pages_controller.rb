class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @user = current_user
    @bookings = Booking.where("user_id = ?", params[:user_id])
  end

  def my_spaces
    @spaces = Space.where(user: current_user)
  end
end
