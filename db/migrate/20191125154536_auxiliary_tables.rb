class AuxiliaryTables < ActiveRecord::Migration[6.0]
  def change
    create_table :users_events do
      add_reference :users_events, :user, foreign_key: true
      add_reference :users_events, :event, foreign_key: true
    end
    create_table :users_interests do
      add_reference :users_interests, :user, foreign_key: true
      add_reference :users_interests, :interest, foreign_key: true
    end
    create_table :events_interests do
      add_reference :events_interests, :event, foreign_key: true
      add_reference :events_interests, :interests, foreign_key: true
    end
    drop_table :friends
    create_table :friends do
      add_reference :friends, :user1, foreign_key: true
      add_reference :friends, :user2, foreign_key: true
    end
  end
end
