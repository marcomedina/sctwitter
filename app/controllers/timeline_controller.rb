class TimelineController < ApplicationController
  def index
    client = Twitter::Client.new()
    @tweets = client.user_timeline current_user.twitter_username
  end

  def show
    client = Twitter::Client.new()
    @tweets = client.user_timeline params[:username]
  end
end
