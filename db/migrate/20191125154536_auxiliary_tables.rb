class AuxiliaryTables < ActiveRecord::Migration[6.0]
  def up
    create_table :attendance do |t|
      t.references :user
      t.references :event
    end
    create_table :users_interests do |t|
      t.references :user
      t.references :interest
    end

    create_table :events_interests do |t|
      t.references :event
      t.references :interest
    end
    change_table :friends do |t|
      t.references :user1
      t.references :user2
    end
  end

  def down
    drop_table :attendance
    drop_table :users_interests
    drop_table :events_interests
  end
end
