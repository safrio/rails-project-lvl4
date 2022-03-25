# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET'], scope: 'user,public_repo,admin:repo_hook'
  OmniAuth.config.on_failure = Web::AuthController.action(:failure)
end
