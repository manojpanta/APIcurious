class RepositoriesController < ApplicationController
  def index
    @repos = MyRepos.new(current_user).repos
    binding.pry
  end

  def new
    @repository = MyRepos.new(current_user).new_repo
    redirect_to repositories_path
  end
end
