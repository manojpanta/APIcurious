class HomeController < ApplicationController
  def index
    if current_user
      @profile_picture = ProfilePic.new(current_user).profile_picture
    end
  end
end
