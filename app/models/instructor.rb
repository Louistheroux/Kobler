class Instructor < ApplicationRecord
  belongs_to :user
  belongs_to :school
  has_many :students

  mount_uploader :photo, PhotoUploader
end
