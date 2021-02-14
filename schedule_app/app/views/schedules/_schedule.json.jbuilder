json.extract! schedule, :id, :building, :number, :date, :time, :avail, :type, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
