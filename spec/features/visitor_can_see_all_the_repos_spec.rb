require 'rails_helper'

describe 'user visits user dashboard' do
  it 'sees starred repos' do
    WebMock.allow_net_connect!
    user = User.create(uid: '1234567', user_name: 'manoj', name: 'manoj', avatar_url: 'https://www.maxhealthcare.in/sites/default/files/doctors/doctor_photo/2018/May/15/Dr%20Manoj%20Kumar.jpg', oauth_token: ENV["api_curious_token"])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    url = "https://api.github.com/users/#{user.user_name}/repos?access_token=#{user.oauth_token}"

    response = File.open('./spec/fixtures/repos.json')

    stub_request(:get, url).to_return(status: 200, body: response)

    visit "/"

    expect(page).to have_content(user.user_name)
    visit "/repositories"
    expect(page).to have_css('.repo_name', count: 30)
    visit "/following"
    expect(page).to have_css('.repo_name', count: 6)
    visit "/followers"
    expect(page).to have_css('.repo_name', count: 2)

    WebMock.disable_net_connect!
  end
end
