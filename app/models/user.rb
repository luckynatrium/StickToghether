class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances
  has_many :friends, join_table: :friends
  has_and_belongs_to_many :interests, join_table: :users_interests

  has_many :images, as: :imageable
  validates :name, :role, presence: true

  scope :confirmed, ->{ where(attendances: {confirmation: true}) }
  scope :unconfirmed, -> { where(attendances: {confirmation: false})}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  def requests()
    ev = events.unconfirmed.order requested_at: :asc
    req_time = ev.extract_associated(:attendances).map {|collection| collection.first.requested_at}.sort
    pack_to_h(ev,req_time)
  end

  def pack_to_h(events, times)
    res = []
    events.each_with_index do |x, i|
      res << [:event,:time].zip([x, times[i]])
      res[i] = res[i].to_h
    end
    res
  end

end