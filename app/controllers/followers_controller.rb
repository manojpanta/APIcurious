class FollowersController < ApplicationController
  def index
    @followers = MyFollowers.new(current_user).followers
  end
end
