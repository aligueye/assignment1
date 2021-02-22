class Schedule < ApplicationRecord
    belongs_to :rooms, optional: true

    def self.import(file)

        CSV.foreach(file.path, headers: true) do |row|
            
            # Find room ID by building and number
            room = Room.find_by(building: row[0], number: row[1])
            
            room_data = Hash[ 
                "building" => row[0],
                "number" => row[1],
                "date" => row[2],
                "time" => row[3],
                "avail" => row[4],
                "booking_type" => row[5],
                "room_id" => room.id,
                "cap" => room.cap,
                "comp_avail" => room.comp_avail,
                "food" => room.food
            ]
            self.create! room_data
        end
    end

end
