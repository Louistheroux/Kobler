class Api::V1::BookingsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:homepage]

  include ActionController::MimeResponds

  def index
    @bookings = current_user.instructor.bookings
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.start_time = DateTime.parse(params[:start_time])
    @booking.end_time = DateTime.parse(params[:end_time])
    if @booking.save
      render :index
    else
      render_error
    end
  end

  def create
    @booking = Booking.new
    @booking.start_time = DateTime.parse(params[:end_time])
    end_time =  @booking.start_time.change(hour: @booking.start_time.hour + 1, min: @booking.start_time.min + 30)
    @booking.end_time = end_time
    @booking.instructor = current_user.instructor
    @booking.save
    respond_to do |format|
      format.html { redirect_to baseworkweek_path }
    end
  end

  def destroy
    booking = Booking.find(params[:id])
    if booking.destroy
      redirect_to bookings_path
    else
      render_error
    end
  end

  private

  def availability_params
    params.require(:booking).permit(:start_time, :end_time, :pick_up_point, :drop_off_point)
  end

  def render_error
    render json: { errors: @booking.errors.full_messages },
    status: :unprocessable_entity
  end
end
