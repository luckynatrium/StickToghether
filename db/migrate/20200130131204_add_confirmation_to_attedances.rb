class AddConfirmationToAttedances < ActiveRecord::Migration[6.0]
  def up
    add_column :attendances, :confirmation, :boolean, default: false
  end

  def down
    remove_column :attendances, :confirmation
  end
end
