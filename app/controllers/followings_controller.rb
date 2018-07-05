class FollowingsController < ApplicationController
  def index
    @myfollowings ||= MyFollowings.new(current_user).followings
  end
end
