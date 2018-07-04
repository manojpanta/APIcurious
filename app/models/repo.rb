class Repo
  attr_reader :name, :url

  def initialize(attributes)
    @name = attributes[:name]
    @url = attributes[:owner][:html_url]
  end
end
