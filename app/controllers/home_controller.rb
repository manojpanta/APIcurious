class HomeController < ApplicationController
  def index
    if current_user
      @repos = MyRepos.new(current_user).repos
    end
  end
end
