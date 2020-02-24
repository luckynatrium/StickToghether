class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  has_and_belongs_to_many :interests, join_table: :events_interests
  has_many :images, as: :imageable
  belongs_to :creator, class_name:'User', foreign_key: :creator_id
  scope :confirmed, ->{ where(attendances: {confirmation: true}) }
  scope :unconfirmed, -> { where(attendances: {confirmation: false})}
  scope :approved, -> {where approved: true}
  scope :refused, -> {where approved: false}
  scope :wait_moderating, -> {where approved: nil}

  def unconfirmed_users
    users.unconfirmed
  end

  def participants
    users.confirmed
  end

  def moderated?
    !approved.nil?
  end

  def approved?
    approved
  end

  def status
    case approved
    when true
      "OK"
    when false
      "Refused"
    else
      'Moderated'
    end
  end

  def reduced_description(restriction)
    if description.length > restriction
      description[0,100] + '...'
    else
      description
    end
  end

end
