class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :design]

  def home
    @personal_tour = PersonalTour.new
  end

  def design
  end
end
