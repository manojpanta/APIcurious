OmniAuth.config.test_mode = true
omniauth_hash = { 'provider' => 'github',
                  'uid' => '12345',
                  'info' => {
                      'name' => 'manoj',
                      'email' => 'manojpanta.yahoo.com',
                      'nickname' => 'manoj'
                  },
                  'extra' => {'raw_info' =>
                                  { 'location' => 'San Francisco',
                                    'gravatar_id' => '123456789'
                                  }
                  }
}

OmniAuth.config.add_mock(:github, omniauth_hash)
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
