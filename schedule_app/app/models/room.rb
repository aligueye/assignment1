class Room < ApplicationRecord
    has_many :schedules
    
    def self.import(file)

        CSV.foreach(file.path, headers: true) do |row|
           
            # Assigns Computer Availible variable bool
            if row[3] == "Yes"
                row[3] = true
            else
                row[3] = false
            end

            # Assigns Food variable bool
            if row[6] == "Yes"
                row[6] = true
            else
                row[6] = false
            end

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
