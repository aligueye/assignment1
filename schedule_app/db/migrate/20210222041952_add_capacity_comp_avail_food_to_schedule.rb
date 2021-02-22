class AddCapacityCompAvailFoodToSchedule < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :cap, :integer
    add_column :schedules, :comp_avail, :boolean
    add_column :schedules, :food, :boolean
  end
end
