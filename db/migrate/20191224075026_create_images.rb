class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :url, null: false
      t.references :imageable, polymorphic: true ,null:false
      t.timestamps
    end
  end

  def down
    drop_table :images
  end
end
