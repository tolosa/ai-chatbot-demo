OpenAI.configure do |config|
  config.access_token = Rails.application.credentials.openia.access_token
  config.log_errors = true
end