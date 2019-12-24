class FriendsController < ApplicationController

  def friends
    @friends = Friend.where(['user1 = ? or user2 = ?',current_user.id,current_user.id]).joins(:user)#TODO get all friends of current_user
  end

end
