class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :building
      t.string :number
      t.integer :cap
      t.boolean :comp_avail
      t.string :seat_avail
      t.string :seat_type
      t.boolean :food
      t.string :dept
      t.string :room_type

      t.timestamps
    end
  end
end
