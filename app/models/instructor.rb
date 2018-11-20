class Instructor < ApplicationRecord
  belongs_to :user
  belongs_to :school

  mount_uploader :photo, PhotoUploader
end
