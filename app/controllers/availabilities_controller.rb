class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.all
  end

  def update
    @availability.find(availabilty_params)
    #generate_bookings
  end

  def create
   #generate_bookings
  end

  def new
  end

  private

  def availabilty_params
    params.require(:availability).permit(:start_time, :end_time, :instructor)
  end
end
