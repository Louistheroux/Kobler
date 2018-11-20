class User < ApplicationRecord
  has_many :instructors
  has_many :students
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# ??????
  validates :full_name, :phone_number, :address, presence: true
  validates :email, presence: true, uniqueness: true
end
