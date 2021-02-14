class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :building
      t.string :number
      t.string :date
      t.string :time
      t.boolean :avail
      t.string :type

      t.timestamps
    end
  end
end
