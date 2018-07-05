class GithubUser
  attr_reader :name,
              :url
  def initialize(attributes)
    @name = attributes[:login].capitalize
    @url = attributes[:html_url]
  end
end
