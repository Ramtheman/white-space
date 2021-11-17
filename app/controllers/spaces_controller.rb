class SpacesController < ApplicationController
  def index
    @spaces = Space.all
    @users = User.all

    @markers = @users.geocoded.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude
      }
    end
  end

  def show
    @space = Space.find(params[:id])
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    if @space.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def destroy
    @space = Space.find(params[:id])
    @space.destroy
    redirect_to my_spaces_path
  end

  private

  # def set_space
  #   @space = Space.find(params[:id])
  # end

  def space_params
    params.require(:space).permit(:title, :space_type, :price_daily, :location)
  end
end
