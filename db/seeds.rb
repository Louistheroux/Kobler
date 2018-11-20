# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Booking.destroy_all
Student.destroy_all
Instructor.destroy_all
School.destroy_all
Location.destroy_all
User.destroy_all

greg = User.create!(
  full_name: 'Greg Stachowiak',
  email: 'gregista88@gmail.com',
  password: '123123'
)


bjorn = User.create!(
  full_name: 'Bjørn Brok',
  email: 'bjorn@gmail.com',
  password: '123123'
)

test_location = Location.create!(
  longitude: 52.112233,
  latitude: 1.23412,
  address: "Nørrebrogade 12"
  )

test_school = School.create!(
  phone_number: 12345678,
  email: "louistheroux@live.com",
  location_id: test_location
  )

test_instructor = Instructor.create!(
  photo: "",
  user: bjorn,
  school: test_school
  )

test_student = Student.create!(
  user: greg,
  school: test_school,
  instructor: test_instructor
  )
