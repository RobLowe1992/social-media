require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get :create" do
    get friendships_:create_url
    assert_response :success
  end

  test "should get :destroy" do
    get friendships_:destroy_url
    assert_response :success
  end

end
