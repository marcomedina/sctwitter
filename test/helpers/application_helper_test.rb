require 'test_helper'

class TimelineHelperTest < ActionView::TestCase
  include ApplicationHelper
  test 'should return correct bootsrap class' do
    assert bootstrap_class_for('error') == 'alert-danger'
    assert bootstrap_class_for('custom') == 'custom'
  end
  test 'should parse tweet mentions correctly' do
    tweet_without_mention = 'this has is mentions'
    tweet_with_mention = 'this is a @mention'
    parsed_tweet = 'this is a <a href="/mention">@mention</a>'

    assert parse_tweet_mentions(tweet_without_mention) == tweet_without_mention
    assert parse_tweet_mentions(tweet_with_mention) == parsed_tweet
  end
end
