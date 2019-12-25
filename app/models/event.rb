class Event < ApplicationRecord
  has_many :users, through: :attendance
  has_many :interests, through: :events_interests
  has_many :images, as: :imageable
  belongs_to :creator, class_name:'User', foreign_key: :creator_id
end
