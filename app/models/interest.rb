class Interest < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_interests
  has_and_belongs_to_many :events, join_table: :events_interests



  def self.add_interests(obj,interests)
    existed_interests = obj.interests
    interests.each do |i|
      cur_i = Interest.find i
      existed_interests << cur_i unless existed_interests.include? cur_i
    end
  end
end
