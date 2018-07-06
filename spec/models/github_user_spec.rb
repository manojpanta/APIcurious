require './app/models/github_user'
require 'spec_helper'

describe GithubUser do
  it 'Exists with valid attributes' do
    user = GithubUser.new({login: 'manoj', html_url: 'www.manojpanta.com'})
    expect(user.name).to eq('Manoj')
    expect(user.url).to eq('www.manojpanta.com')
  end
end
