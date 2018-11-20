class School < ApplicationRecord
  belongs_to :location
  validates :email, :phone_number, :name, uniqueness: true, presence: true
end
