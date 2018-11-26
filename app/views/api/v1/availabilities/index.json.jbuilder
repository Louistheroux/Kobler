json.array! @availabilities do |availability|
  json.extract! availability, :id, :title, :start, :end
end
