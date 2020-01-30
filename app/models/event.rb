class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  has_and_belongs_to_many :interests, join_table: :events_interests
  has_many :images, as: :imageable
  belongs_to :creator, class_name:'User', foreign_key: :creator_id

  def unconfirmed_users
    users.joins(:attendances).where(attendances: {confirmation: false})
  end

  def confirmed_users
    users.joins(:attendances).where(attendances: {confirmation: true})
  end
end
