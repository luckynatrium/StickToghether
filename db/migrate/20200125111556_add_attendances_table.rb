class AddAttendancesTable < ActiveRecord::Migration[6.0]
  def up
    create_table :attendances do |t|
      t.references :user
      t.references :event
      t.boolean :confirmation, default: false

    end
  end

  def down
    drop_table :attendances
  end
end
