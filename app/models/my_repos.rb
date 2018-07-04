class MyRepos

  def initialize(current_user)
    @current_user = current_user
  end

  def repos
    data.map do |repo|
      Repo.new(repo)
    end
  end

  private
  def conn
    Faraday.new(url: "https://api.github.com")
  end

  def response
    conn.get("users/#{@current_user.user_name}/repos?access_token=#{@current_user.oauth_token}")
  end

  def data
    JSON.parse(response.body, symbolize_names: true)
  end
end
