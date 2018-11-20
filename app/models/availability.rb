class Availability < ApplicationRecord
  belongs_to :instructor
  validates :starting_time, presence: true
  validates :ending_time, presence: true
end
