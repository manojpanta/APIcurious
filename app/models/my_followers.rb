class MyFollowers

  def initialize(current_user)
    @current_user = current_user
  end

  def followers
    data.map do |follower|
      follower[:login]
    end
  end

  private

  def conn
    Faraday.new(url: "https://api.github.com")
  end

  def response
    conn.get("users/#{@current_user.user_name}/followers")
  end

  def data
    JSON.parse(response.body, symbolize_names: true)
  end
end
