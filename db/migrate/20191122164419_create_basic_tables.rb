class CreateBasicTables < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :role
      t.integer :carma
    end
    create_table :event do |t|
      t.string :name
      t.string :description
      t.timestamp :date
      t.timestamp :duration
    end
    create_table :interest do |t|
      t.string :name
    end
    create_table :friends do |t|
      t.integer :id_user1
      t.integer :id_user2
    end
  end
end
