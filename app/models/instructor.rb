class Instructor < ApplicationRecord
  belongs_to :user
  belongs_to :school
  has_many :students
  has_many :availabilities, dependent: :destroy
  has_many :bookings

  mount_uploader :photo, PhotoUploader

  after_create :generate_availabilities
  after_create :generate_bookings

  # GENERATING BASEWORKWEEK TEMPLATE
  def generate_availabilities
    now = Time.now
    start_time = now.beginning_of_week
    5.times do
      (8..18).step(1).each do |hour|
        next if hour == 13
        start_time = start_time.change(hour: hour)
        end_time = start_time.change(hour: hour + 1)
        Availability.create!(
          instructor: self,
          start_time: start_time,
          end_time: end_time
        )
      end
      start_time += 86_400
    end
  end

  #GENERATE BOOKINGS FROM AVAILABILITIES
  def generate_bookings
    all_availabilities = self.availabilities
    all_availabilities.each do |booking|
      Booking.create!(
        instructor: self,
        start_time: booking.start_time,
        end_time: booking.end_time
        )
    end
  end

  #GENERATING DUMMI BOOKINGS FOR DEMO PURPOSES
  def generate_students_for_bookings
    random_bookings = self.bookings.shuffle
    random_bookings[0..bookings.size / 2].each do |booking|
      booking.student = Student.all.sample
      booking.save
    end
  end

  def next_week_availabilities
    availabilities.each do |avail|
      avail.start_time = avail.start_time.change(day: avail.start_time.day + 7)
      avail.end_time = avail.end_time.change(day: avail.end_time.day + 7)
      avail.save
    end
  end
end
