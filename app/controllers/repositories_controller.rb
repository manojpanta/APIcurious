class RepositoriesController < ApplicationController
  def index
    @profile_picture = ProfilePic.new(current_user).profile_picture
    @repos = MyRepos.new(current_user).repos
  end
end
