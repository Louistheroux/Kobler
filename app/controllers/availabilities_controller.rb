class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.all
  end

  def update
    @availability.find(availabilty_params)
  end

  def create
  end

  def new
  end

  private

  def availabilty_params
    params.require(:availability).permit(:starting_time, :ending_time, :instructor)
  end
end
