class TimeSchedule < ApplicationRecord
  belongs_to :instructor
  belongs_to :school
  validates :starting_date, :ending_date, presence: true
end
