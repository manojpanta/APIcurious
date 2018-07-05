class FollowersController < ApplicationController
  def index
    @profile_picture = ProfilePic.new(current_user).profile_picture
    @followers = MyFollowers.new(current_user).followers
  end
end
