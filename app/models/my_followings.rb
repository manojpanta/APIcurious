class MyFollowings
  def initialize(current_user)
    @current_user = current_user
  end

  def followings
    MyFollowingsService.new(@current_user).followings
  end
end
