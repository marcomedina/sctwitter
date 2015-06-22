class HomeController < ApplicationController
  def index
    client = Twitter::Client.new()
    @tweets = client.user_timeline current_user.twitter_username
  end
end
