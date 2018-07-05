require 'rails_helper'
RSpec.describe User, type: :model do
  it 'can create new user with attributes' do
    user = User.create!(uid: 2,
                name: 'manaoj',
                user_name: 'manojpanta',
                oauth_token: 'rtcfvghbjknlm',
                avatar_url: 'www.fsdvfv.com')
    expect(user).to be_valid
    expect(user).to be_a(User)
    expect(user.name).to eq(user.name)
    expect(user.user_name).to eq(user.user_name)
    expect(user.oauth_token).to eq(user.oauth_token)
    expect(user.avatar_url).to eq(user.avatar_url)
  end
end
