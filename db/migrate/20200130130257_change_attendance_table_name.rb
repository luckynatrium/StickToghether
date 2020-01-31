class ChangeAttendanceTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :attendance, :attendances
  end
end
