class Event < ApplicationRecord
  has_many :users, through: :attendance
  has_many :interests, through: :events_interests
end
