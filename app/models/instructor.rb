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
    default_slots = time_slots
    5.times do
      default_slots.each do |time_slot|
        start_slot = time_slot[:start]
        next if start_slot[:hour] == 14
        end_slot = time_slot[:end]
        start_time = start_time.change(hour: start_slot[:hour], min: start_slot[:minutes])
        end_time = start_time.change(hour: end_slot[:hour], min: end_slot[:minutes])
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
      booking.pick_up_point = Location.all.sample
      booking.drop_off_point = Location.all.sample
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

  def time_slots
    hour = 9
    minutes = 0
    slots = []
    while hour < 19
      start_time_string = "#{hour}:#{minutes}"
      slot_hash = convert_to_time(start_time_string)
      slots << slot_hash
      next_start_time = "#{slot_hash.dig(:end, :hour)}:#{slot_hash.dig(:end, :minutes)}".to_time + 900
      hour = next_start_time.hour
      minutes = next_start_time.min
    end
    return slots
  end

  def convert_to_time(time)
    start_time_object = time.to_time
    end_time_object = start_time_object + 5400
    {
      start: { hour: start_time_object.hour, minutes: start_time_object.min },
      end: { hour: end_time_object.hour, minutes: end_time_object.min }
    }
  end
end
