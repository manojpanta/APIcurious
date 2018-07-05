class MyFollowersService
  def initialize(current_user)
    @current_user = current_user
  end

  def followers
    data.map do |attributes|
      GithubUser.new(attributes)
    end
  end

  private

  def conn
    Faraday.new(url: "https://api.github.com")
  end

  def response
    conn.get("/user/followers") do |req|
      req.params["access_token"]= @current_user.oauth_token
    end
  end

  def data
    JSON.parse(response.body, symbolize_names: true)
  end
end
