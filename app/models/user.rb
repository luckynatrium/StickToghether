class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances
  has_many :friends, join_table: :friends
  has_and_belongs_to_many :interests, join_table: :users_interests

  has_many :images, as: :imageable
  validates :name, :role, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def requests_for_event(event)
    case event.class
    when Event
      attendances.where(confirmation: false, event_id: event.id)
    when Integer
      attendances.where(confirmation: false, event_id: event)
    else
      Attendance.none
    end
  end

end