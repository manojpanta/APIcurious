class GithubUser
  attr_reader :name,
              :url,
              :avatar_url
  def initialize(attributes)
    @name = attributes[:login].capitalize
    @url = attributes[:html_url]
    @avatar_url = attributes[:avatar_url]
  end
end
