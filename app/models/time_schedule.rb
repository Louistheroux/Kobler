class TimeSchedule < ApplicationRecord
  belongs_to :instructor
  belongs_to :school
  validates :start_time, :end_time, presence: true
end
