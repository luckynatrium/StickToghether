class AddRequestedAt < ActiveRecord::Migration[6.0]
  def up
    add_column :attendances, :requested_at, :timestamp
  end
end
