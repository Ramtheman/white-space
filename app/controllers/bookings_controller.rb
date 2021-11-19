class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user)
  end

  def new
    @booking = Booking.new

    @space = Space.find(params[:space_id])
  end

  def create
    @space = Space.find(params[:space_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.space = @space
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.confirmed = params[:booking][:confirmed]
    if @booking.save
      redirect_to my_spaces_path
    else
      render :my_spaces_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path(@user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
