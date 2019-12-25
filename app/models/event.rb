class Event < ApplicationRecord
  has_many :users, through: :attendance
  has_and_belongs_to_many :interests, join_table: :events_interests
  has_many :images, as: :imageable
  belongs_to :creator, class_name:'User', foreign_key: :creator_id
end
