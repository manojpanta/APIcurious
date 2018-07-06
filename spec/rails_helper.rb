require 'webmock/rspec'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

def stub_omniauth
  OmniAuth.config.test_mode = true
   OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
     provider: 'github',
     uid: 34468256,
     info: {
       nickname: 'manojpanta',
       name: 'Manoj Panta'
     },
     credentials: {
       token: ENV["api_curious_token"]
     },
     extra: {
       raw_info:{
         avatar_url: "https://avatars1.githubusercontent.com/u/34468256?v=4"
       }
     }
     })



end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"


  config.use_transactional_fixtures = true


  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

end
