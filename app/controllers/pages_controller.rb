class PagesController < ApplicationController
  def home
  end

  def my_spaces
    @spaces = Space.where(user: current_user)
  end
end
