class AddSchedulesToRoom < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :schedules, null: true, foreign_key: true
  end
end
