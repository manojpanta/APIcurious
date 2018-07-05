class MyFollowers

  def initialize(current_user)
    @current_user = current_user
  end

  def followers
    MyFollowersService.new(@current_user).followers
  end
end
