class User < ApplicationRecord
  has_many :events, through: :attendance
  has_many :friends, join_table: :friends
  has_and_belongs_to_many :interests, join_table: :users_interests
  validates :name, :role, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end