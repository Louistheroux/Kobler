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


############### Creating users #################
puts "Creating users..."


greg = User.create!(
  full_name: 'Greg Stachowiak',
  email: 'gregista88@gmail.com',
  password: '123123',
  phone_number: '12312312',
  address: 'Sundvænget 6, 2900 Hellerup'
  )

bjorn = User.create!(
  full_name: 'Bjørn Brok',
  email: 'bjorn@gmail.com',
  password: '123123',
  phone_number: '12312312',
  address: 'Hellebækgade 42, 1. th'
  )

kasper = User.create!(
  full_name: 'Kasper Weidick',
  email: 'kasper@gmail.com',
  password: '123123',
  phone_number: '12312312',
  address: 'Vævergade 7, 2200 København'
  )

louis = User.create!(
  full_name: 'Louis Theroux',
  email: 'louistheroux@live.com',
  password: 'louis123',
  phone_number: '12312312',
  address: 'Refsnæsgade 46, 2200 København'
  )

makena = User.create!(
  full_name: 'Makena Hawley',
  email: 'makena@gmail.com',
  password: '123123',
  phone_number: '12312312',
  address: 'Nørrebrogade 34, 2200 København'
  )

jerrel = User.create!(
  full_name: 'Jerrel Burney',
  email: 'jerrel@gmail.com',
  password: '123123',
  phone_number: '12312312',
  address: 'Inge Lehmanns Vej 7, 2100 København'
  )

janina = User.create!(
  full_name: 'Janina Kokkonen',
  email: 'janina@gmail.com',
  password: '123123',
  phone_number: '12312312',
  address: 'Slagelsesgade 12, 2100 København'
  )

irene = User.create!(
  full_name: 'Irene Smith',
  email: 'irene@gmail.com',
  password: '123123',
  phone_number: '12312312',
  address: 'Willemoesgade 11, 2100 København'
  )

henry = User.create!(
  full_name: 'Henry Stenberg',
  email: 'henry@gmail.com',
  password: '123123',
  phone_number: '12312312',
  address: 'Krausesvej 2, 2100 København'
  )

brian = User.create!(
  full_name: 'Brian Welch',
  email: 'brian@gmail.com',
  password: '123123',
  phone_number: '12312312',
  address: 'Assensgade 5, 2100 København'
  )

beltran = User.create!(
  full_name: 'Beltran Nowack',
  email: 'beltran@gmail.com',
  password: '123123',
  phone_number: '12312312',
  address: 'Helgesensgade 5, 2100 København'
  )

anna = User.create!(
  full_name: 'Anna Litfin',
  email: 'anna@gmail.com',
  password: '123123',
  phone_number: '12312312',
  address: 'Fåborggade 2, 2100 København'
  )


schumacher = User.create!(
  full_name: 'Michael Schumacher',
  email: 'schumacher@hotmail.com',
  password: '123123',
  phone_number: '12312312',
  address: 'Norgesmindevej 6, 2900 Hellerup'
  )

hamilton = User.create!(
  full_name: 'Lewis Hamilton',
  email: 'hamilton@gmail.com',
  password: '123123',
  phone_number: '12312312',
  address: 'Frederikkevej 19, 2900 Hellerup'
  )




############### Creating Locations #################
puts "Creating locations..."

location_1 = Location.create!(
  address: "Vibekegade 25, Copenhagen"
  )

location_2 = Location.create!(
  address: "Amager Strandvej 100, 2300 Copenhagen S"
  )

location_3 = Location.create!(
  address: "H.C Andersens Blvd. 12, Copenhagen"
  )

location_4 = Location.create!(
  address: "Enghavevej 34, Copenhagen"
  )

location_5 = Location.create!(
  address: "Kongens Nytorv 9, Copenhagen"
  )

location_6 = Location.create!(
  address: "Strandgade 108, Copenhagen"
  )

location_7 = Location.create!(
  address: "Landgreven 3, Copenhagen"
  )

location_8 = Location.create!(
  address: "Torvegade 62, Copenhagen"
  )

############### Creating schools #################
puts "Creating schools..."

school_1 = School.create!(
  name: "Kösem's køreskole",
  phone_number: '12345678',
  email: "louistheroux@live.com",
  location: location_1
  )



############### Creating instructors #################
puts "Creating instructors..."

instructor_1 = Instructor.create!(
  user: schumacher,
  school: school_1
  )

instructor_1.remote_photo_url = "https://www.thestar.com/content/dam/thestar/sports/2014/06/16/michael_schumacher_out_of_a_coma_released_from_hospital/michael_schumacher.jpg"
instructor_1.save!



instructor_2 = Instructor.create!(
  user: hamilton,
  school: school_1
  )

instructor_2.remote_photo_url = "https://specials-images.forbesimg.com/imageserve/5b1559054bbe6f74868b8385/416x416.jpg?background=000000&cropX1=1114&cropX2=3921&cropY1=307&cropY2=3112"
instructor_2.save!



############### Creating students #################
puts "Creating students..."

student_1 = Student.create!(
  user: greg,
  school: school_1,
  instructor: instructor_1
  )

student_2 = Student.create!(
  user: bjorn,
  school: school_1,
  instructor: instructor_1
  )

student_3 = Student.create!(
  user: kasper,
  school: school_1,
  instructor: instructor_1
  )

student_4 = Student.create!(
  user: louis,
  school: school_1,
  instructor: instructor_1
  )

student_5 = Student.create!(
  user: anna,
  school: school_1,
  instructor: instructor_1
  )

student_6 = Student.create!(
  user: janina,
  school: school_1,
  instructor: instructor_1
  )

student_7 = Student.create!(
  user: makena,
  school: school_1,
  instructor: instructor_1
  )

student_8 = Student.create!(
  user: jerrel,
  school: school_1,
  instructor: instructor_1
  )


puts "Finished"
