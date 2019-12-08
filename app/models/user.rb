class User < ApplicationRecord
  has_many :events
  has_many :interests, through: :users_events
  has_many :events, through: :attendance
  validates :name, :role, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
