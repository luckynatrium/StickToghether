class CreateBasicTables < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :role
      t.integer :carma
    end
    create_table :events do |t|
      t.string :name
      t.text :description
      t.timestamp :date
      t.timestamp :duration
    end
    create_table :interests do |t|
      t.string :name
    end
    create_table :friends do |t|
      t.boolean :confirmation
    end
  end

  def down
    drop_table :users
    drop_table :events
    drop_table :friends
    drop_table :interests
  end
end
