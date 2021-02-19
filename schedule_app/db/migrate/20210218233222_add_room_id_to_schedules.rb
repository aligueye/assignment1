class AddRoomIdToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :room_id, :integer
  end
end
