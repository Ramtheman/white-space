class SpacesController < ApplicationController
  def index
    if params[:query].present?
      @spaces = Space.search_by_title_and_space_type(params[:query])
      @all_spaces = false
    else
      @spaces = Space.all
      @all_spaces = true
    end

    @markers = @spaces.geocoded.map do |space|
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
    @space.type_image = "potato.jpg"
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
    params.require(:space).permit(:title, :space_type, :location, :price)
  end
end
