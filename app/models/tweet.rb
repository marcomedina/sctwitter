class Tweet
  config = {
    consumer_key:    "ALZ1KmfFC0OX2uWOY4rGfFBKT",
    consumer_secret: "otEOP5q6g6PY8ztn9aMQxkYnhWvGp3A5mFxQ6vwxKMEGOM0fYU",
  }
  @@client = Twitter::REST::Client.new(config)
  @@limit = 20

  def self.search(term)
    @@client.search(term, result_type: "recent").take(@@limit)
  end

  def self.user(username)
    @@client.user(username)
  end

  def self.last_tweets_for(username)
    @@client.user_timeline(username)
  end
end

