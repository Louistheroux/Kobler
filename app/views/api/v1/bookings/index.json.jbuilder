json.array! @bookings do |booking|
  json.extract! booking, :id, :title, :start, :end, :start_point, :end_point
end
