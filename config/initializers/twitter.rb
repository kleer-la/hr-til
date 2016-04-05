TwitterClient = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["HA_TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["HA_TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["HA_TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["HA_TWITTER_ACCESS_TOKEN_SECRET"]
end
