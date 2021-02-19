class RemoveSchedulesFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_reference :rooms, :schedules, null: false, foreign_key: true
  end
end
