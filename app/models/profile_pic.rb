class ProfilePic

  def initialize(current_user)
    @current_user = current_user
  end

  def profile_picture
    data[:avatar_url]
  end



  def conn
    Faraday.new(url: "https://api.github.com")
  end

  def response
    conn.get("users/#{@current_user.user_name}?access_token=#{@current_user.oauth_token}")
  end

  def data
    JSON.parse(response.body, symbolize_names: true)
  end
end
