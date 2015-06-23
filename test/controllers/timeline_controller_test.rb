require 'test_helper'

class TimelineControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "logged in should get show" do
    sign_in users(:one)
    get :index
    assert_response :success
  end

  test "not authenticated should get redirect" do
    get :index
    assert_response :redirect
  end
end
