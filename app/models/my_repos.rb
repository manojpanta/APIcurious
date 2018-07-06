class MyRepos
  attr_reader :name
  def initialize(current_user)
    @name = name
    @current_user = current_user
  end

  def repos
    MyReposService.new(@current_user).repos
  end

  def new_repo(repo_name)
    data(repo_name)
  end

  private

  def connection
    Faraday.new(url: "https://api.github.com")
  end

  def response(repo_name)
    connection.post("user/repos?access_token=#{@current_user.oauth_token}") do |req|
      req.body = {name: repo_name, description: "This is sample repo coming from API curious app."}.to_json
    end
  end

  def data(repo_name)
    JSON.parse(response(repo_name).body, symbolize_names: true)
  end
end
