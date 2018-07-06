require 'rails_helper'
describe MyReposService do
  it 'exists' do
    my_repos = MyReposService.new("user")
    expect(my_repos).to be_a(MyReposService)
  end
  it 'shows all my repos', :vcr do
      user = User.create(uid: '1234567', user_name: 'manoj', name: 'manoj', avatar_url: 'https://www.maxhealthcare.in/sites/default/files/doctors/doctor_photo/2018/May/15/Dr%20Manoj%20Kumar.jpg', oauth_token: ENV["api_curious_token"])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      my_repos = MyReposService.new(user)

      expect(my_repos.repos.count).to eq(30)
  end
end
