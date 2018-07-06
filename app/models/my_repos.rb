class MyRepos
  attr_reader :name
  def initialize(current_user, name="new_name")
    @name = name
    @current_user = current_user
  end

  def repos
    MyReposService.new(@current_user).repos
  end

  def new_repo
    data
  end

  private

  def connection
    Faraday.new(url: "https://api.github.com")
  end

  def response
    connection.post("user/repos?access_token=#{@current_user.oauth_token}") do |req|
      req.body = '{"name": "this is being created by my app", "description": "This is your first repository"}'
    end
  end

  def data
    JSON.parse(response.body, symbolize_names: true)
  end
end
