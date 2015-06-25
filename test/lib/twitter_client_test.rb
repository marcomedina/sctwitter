require 'test_helper'
#include Twitter::Client

class TwitterClientTest < ActionView::TestCase
  test 'get last 25 tweets from my timeline' do
    c = Twitter::Client.new
    timeline = c.user_timeline('medinamarco')
    assert timeline.size == 25
  end

  test 'get last 25 tweets from a random search' do
    c = Twitter::Client.new
    results = c.search('justin bieber')
    assert results.size == 25
  end
end

