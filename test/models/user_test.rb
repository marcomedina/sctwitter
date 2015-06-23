require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without email, password and twitter_username" do
    user = User.new
    assert_not user.save
  end
  test "should save user with email, password and twitter_username" do
    user = User.new()
    user.email = 'atest@atest.com'
    user.password = '123123123'
    user.twitter_username = 'twittername'
    assert user.save
  end
end
