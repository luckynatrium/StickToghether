class AddColumnApproved < ActiveRecord::Migration[6.0]
  def up
    add_column :events, :approved, :boolean, default: nil
    add_column :events, :approved_by, :bigint
    add_foreign_key :events, :admin_users, column: :approved_by
  end

  def down
    remove_column :events, :approved
    remove_column :events, :approved_by
  end
end
