class User < ApplicationRecord
  has_many :interests, through: :users_interests
  has_many :events, through: :attendance
  has_many :friends
  validates :name, :role, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
