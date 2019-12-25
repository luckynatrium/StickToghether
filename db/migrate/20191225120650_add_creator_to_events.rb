class AddCreatorToEvents < ActiveRecord::Migration[6.0]
  def change
    change_table :events do |t|
      t.bigint :creator_id
      add_foreign_key :events, :users,column: :creator_id
    end
  end

  def down
    remove_foreign_key :events,:users,column: :creator_id
    remove_column :events,:creator_id
  end
end
