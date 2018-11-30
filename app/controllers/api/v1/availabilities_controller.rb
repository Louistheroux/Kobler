require 'pry-byebug'

class Api::V1::AvailabilitiesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:homepage]
  #before_action :set_availability
  include ActionController::MimeResponds

  def index
    @availabilities = current_user.instructor.availabilities
  end

  def create
    @availability = Availability.new
    @availability.start_time = DateTime.parse(params[:end_time])
    end_time = @availability.start_time + 60 * 60 * 1.5
    @availability.end_time = end_time
    @availability.instructor = current_user.instructor
    @availability.save
    respond_to do |format|
      format.html { redirect_to baseworkweek_path }
    end
  end

  def update
    @availability = Availability.find(params[:id])
    @availability.start_time = DateTime.parse(params[:start_time])
    @availability.end_time = DateTime.parse(params[:end_time])
    if @availability.save
      render :index
    else
      render_error
    end
  end

  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy
  end

  private

  def availability_params
    params.require(:availability).permit(:start_time, :end_time)
  end

  def render_error
    render json: { errors: @availability.errors.full_messages},
    status: :unprocessable_entity
  end
end
