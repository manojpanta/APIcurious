opts = {scope: 'repo'}

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['github_client'], ENV['github_client_secret'], opts
end
