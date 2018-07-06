class RepositoriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @repos = MyRepos.new(current_user).repos
  end

  def new
  end

  def create
    @repository = MyRepos.new(current_user).new_repo(params[:repo_name])
    redirect_to repositories_path
  end
end
