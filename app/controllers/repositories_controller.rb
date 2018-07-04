class RepositoriesController < ApplicationController
  def index
    @repos = MyRepos.new(current_user).repos
  end
end
