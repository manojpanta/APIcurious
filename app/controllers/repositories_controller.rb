class RepositoriesController < ApplicationController
  def index
    @repos ||= MyRepos.new(current_user).repos
  end

  def new
    @repository = MyRepos.new(current_user).new_repo
    @current_user = current_user
    redirect_to repositories_path
  end
end
