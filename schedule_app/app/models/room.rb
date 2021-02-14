class Room < ApplicationRecord
    has_many :schedules
    
    def self.import(file)

        CSV.foreach(file.path, headers: true) do |row|
            # format csv to acceptable hash, my vars
            # room_data = row.to_h
            # room_data[:building] = room_data.delete :Building
            # room_data[:number] = room_data.delete :Room
            
            room_data = Hash[ 
                "building" => row[0],
                "number" => row[1],
                "cap" => row[2],
                "comp_avail" => row[3],
                "seat_avail" => row[4],
                "seat_type" => row[5],
                "food" => row[6],
                "dept" => row[7],
                "room_type" => row[8]
            ]
            self.create! room_data
        end
    end
end
