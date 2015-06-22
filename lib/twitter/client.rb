require 'json'
module Twitter
  class Client
    @@oauth_token = ENV['TWITTER_ACCESS_TOKEN']
    @@oauth_token_secret = ENV['TWITTER_ACCESS_SECRET']
    @@api_key = ENV['TWITTER_API_KEY']
    @@api_secret = ENV['TWITTER_API_SECRET']
    @@count_limit = 20

    def initialize()
      consumer = OAuth::Consumer.new(@@api_key, @@api_secret, { :site => "https://api.twitter.com", :scheme => :header })
      token_hash = { :oauth_token => @@oauth_token, :oauth_token_secret => @@oauth_token_secret }
      @access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
    end

    def user_timeline(username)
      response = @access_token.request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json?count=#{@@count_limit}&screen_name=#{username}")
      JSON.parse(response.body)
    end
  end
end
