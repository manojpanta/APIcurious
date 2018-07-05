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
    data1
  end

  private

  def connection
    Faraday.new(url: "https://api.github.com")
  end

  def response1
    connection.post("user/repos?access_token=#{@current_user.oauth_token}&scope=public_repo") do |req|
      req.body = {"name": "Hello-World","description": "This is your first repository"}
    end
  end

  def data1
    JSON.parse(response1.body, symbolize_names: true)
  end
end
