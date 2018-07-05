class FollowingsController < ApplicationController

  def index
    @profile_picture = ProfilePic.new(current_user).profile_picture
    @myfollowings = MyFollowings.new(current_user).followings
  end

end
