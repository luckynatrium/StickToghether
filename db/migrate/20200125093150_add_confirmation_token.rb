class AddConfirmationToken < ActiveRecord::Migration[6.0]
  def change
    change_table :attendance do |t|
      t.boolean :confirmation
    end
  end

  def down
    remove_column :attendance, :confirmation
  end
end
