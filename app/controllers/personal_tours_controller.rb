class PersonalToursController < ApplicationController
  def create
    @personal_tour = PersonalTour.new(personal_tour_params)

    if @personal_tour.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def personal_tour_params
    params.require(:personal_tour).permit(:driving_school_name, :full_name, :phone_number, :email, :number_of_teachers)
  end
end
