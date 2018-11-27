class PersonalTour < ApplicationRecord
  validates :full_name, presence: true
  validates :driving_school_name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :number_of_teachers, presence: true

end
