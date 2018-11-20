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
  password: '123123'
)

bjorn = User.create!(
  full_name: 'Bjørn Brok',
  email: 'bjorn@gmail.com',
  password: '123123'
)

kasper = User.create!(
  full_name: 'Kasper Weidick',
  email: 'kasper@gmail.com',
  password: '123123'
)

louis = User.create!(
  full_name: 'Louis Theroux',
  email: 'louistheroux@live.com',
  password: 'louis123'
)

makena = User.create!(
  full_name: 'Makena Hawley',
  email: 'makena@gmail.com',
  password: '123123'
)

jerrel = User.create!(
  full_name: 'Jerrel Burney',
  email: 'jerrel@gmail.com',
  password: '123123'
)

janina = User.create!(
  full_name: 'Janina Kokkonen',
  email: 'janina@gmail.com',
  password: '123123'
)

irene = User.create!(
  full_name: 'Irene Smith',
  email: 'irene@gmail.com',
  password: '123123'
)

henry = User.create!(
  full_name: 'Henry Stenberg',
  email: 'henry@gmail.com',
  password: '123123'
)

brian = User.create!(
  full_name: 'Brian Welch',
  email: 'brian@gmail.com',
  password: '123123'
)

beltran = User.create!(
  full_name: 'Beltran Nowack',
  email: 'beltran@gmail.com',
  password: '123123'
)

anna = User.create!(
  full_name: 'Anna Litfin',
  email: 'anna@gmail.com',
  password: '123123'
)



schumacher = User.create!(
  full_name: 'Michael Schumacher',
  email: 'schumacher@hotmail.com',
  password: '123123'
  )

hamilton = User.create!(
  full_name: 'Lewis Hamilton',
  email: 'hamilton@gmail.com',
  password: '123123'
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
  phone_number: 12345678,
  email: "louistheroux@live.com",
  location_id: location_1
  )



############### Creating instructors #################
puts "Creating instructors..."

instructor_1 = Instructor.create!(
  user: schumacher,
  school: school_1
  )

instructor_1.remote_photo_url = "https://images.thestar.com/JiQVes9W-Ndp8lnmq7-72S9NxdI=/1200x778/smart/filters:cb(1513459234935)/https://www.thestar.com/content/dam/thestar/sports/2014/06/16/michael_schumacher_out_of_a_coma_released_from_hospital/michael_schumacher.jpg"
instructor_1.save!



instructor_2 = Instructor.create!(
  user: hamilton,
  school: school_1
  )

instructor_2.remote_photo_url = "https://www.amore.ng/wp-content/uploads/2017/12/Lewis-Hamilton-Formula-1.jpg"
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
