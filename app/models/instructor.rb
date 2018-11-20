class Instructor < ApplicationRecord
  belongs_to :user
  belongs_to :school
  # do we need this???
  validates :photo, presence: true
end
