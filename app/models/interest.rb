class Interest < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_interests
  has_and_belongs_to_many :events, join_table: :events_interests
end
