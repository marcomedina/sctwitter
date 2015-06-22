require 'json'
module Twitter
  class Client
    @@oauth_token = ENV['TWITTER_ACCESS_TOKEN']
    @@oauth_token_secret = ENV['TWITTER_ACCESS_SECRET']
    @@api_key = ENV['TWITTER_API_KEY']
    @@api_secret = ENV['TWITTER_API_SECRET']
    @@count_limit = 20
    @@cache_hash = {}
    @@cache_expires = 5 # minutes

    def initialize()
      consumer = OAuth::Consumer.new(@@api_key, @@api_secret, { :site => "https://api.twitter.com", :scheme => :header })
      token_hash = { :oauth_token => @@oauth_token, :oauth_token_secret => @@oauth_token_secret }
      @access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
    end

    def user_timeline(username)
      url = "https://api.twitter.com/1.1/statuses/user_timeline.json?count=#{@@count_limit}&screen_name=#{username}"
      perform_request url
    end

    def search(term)
      url = "https://api.twitter.com/1.1/search/tweets.json?count=#{@@count_limit}&q=#{term}"
      perform_request url, 'statuses'
    end

    private
    def perform_request(url, key=nil)
      if is_in_cache(url) && is_not_expired(url)
        return @@cache_hash[url][:data]
      end
      response = @access_token.request(:get, url)
      data = parse_tweets(response.body, key)
      @@cache_hash[url] = {
        data: data,
        last_call: Time.zone.now
      }
      data
    end

    def is_not_expired(key)
      Time.zone.now < @@cache_hash[key][:last_call] + @@cache_expires.minutes
    end

    def is_in_cache(key)
      !@@cache_hash[key].nil?
    end

    def parse_tweets(body, key=nil)
      json = JSON.parse(body)
      if !key.nil?
        return json[key]
      end
      json
    end
  end
end
