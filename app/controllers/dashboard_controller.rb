class DashboardController < ApplicationController
  def index
    @total_lessons_this_week = current_user.instructor.bookings
                                         .where("start_time > ? AND start_time < ?",
                                                DateTime.now.beginning_of_week,
                                                DateTime.now.end_of_week
                                               )
    @unbooked_lessons = @total_lessons_this_week.where(student_id: nil)
    @booked_lessons = @total_lessons_this_week.count - @unbooked_lessons.count
  end
end
