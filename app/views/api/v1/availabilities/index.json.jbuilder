json.array! @availabilities do |availability|
  json.extract! availability, :title, :start, :end
end
