class Booking < ApplicationRecord
  belongs_to :instructor
  #belongs_to :time_schedule
  belongs_to :student, optional: true
  belongs_to :pick_up_point, class_name: "Location", foreign_key: "pick_up_point_id", optional: true
  belongs_to :drop_off_point, class_name: "Location", foreign_key: "drop_off_point_id", optional: true
   # do we need uniqueness????
  validates  :start_time, presence: true
  validates  :end_time, presence: true

  def start
    start_time
  end

  def end
    end_time
  end

  def title
    self.student ? self.student.user.full_name : "Available"
  end

  def start_point
    pick_up_point ? pick_up_point.address : "TBD"
  end

  def end_point
    drop_off_point ? drop_off_point.address : "TBD"
  end
end
