class Api::V1::AvailabilitiesController < Api::V1::BaseController
  def index
    #NEEDS TO BE DYNAMIC
    @availabilities = Instructor.first.availabilities
  end

  def create
    @availability = Availability.new(availability_params)
  end

  def update
  end

  private

  def availability_params
    params.require(:availability).permit(:instructor, :start_time, :end_time)
  end
end
