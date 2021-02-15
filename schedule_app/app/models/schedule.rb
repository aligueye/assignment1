class Schedule < ApplicationRecord
    belongs_to :rooms, optional: true

    def self.import(file)

        CSV.foreach(file.path, headers: true) do |row|
            # format csv to acceptable hash, my vars
            # room_data = row.to_h
            # room_data[:building] = room_data.delete :Building
            # room_data[:number] = room_data.delete :Room
            
            room_data = Hash[ 
                "building" => row[0],
                "number" => row[1],
                "date" => row[2],
                "time" => row[3],
                "avail" => row[4],
                "type" => row[5]
            ]
            self.create! room_data
        end
    end

end
