class Availability < ApplicationRecord
  belongs_to :instructor
  validates :start_time, presence: true
  validates :end_time, presence: true

  def start
    start_time
  end

  def end
    end_time
  end

  def title
    "Foobar"
  end
end

# Availability.create instructor: Instructor.first, start_time: DateTime.new(2018,11,22,11), end_time: DateTime.new(2018,11,22,12)
