class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  has_and_belongs_to_many :interests, join_table: :events_interests
  has_many :images, as: :imageable
  belongs_to :creator, class_name:'User', foreign_key: :creator_id
  scope :confirmed, ->{ where(attendances: {confirmation: false}) }
  scope :unconfirmed, -> { where(attendances: {confirmation: true})}

  def unconfirmed_users
    users.where(attendances: {confirmation: false})
  end

  def confirmed_users
    users.where(attendances: {confirmation: true})
  end

  def reduced_description(restriction)
    if description.length > restriction
      description[0,100] + '...'
    else
      description
    end
  end
end
