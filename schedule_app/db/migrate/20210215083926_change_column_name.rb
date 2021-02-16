class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :schedules, :type, :booking_type
  end
end
