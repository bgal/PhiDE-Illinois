require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get edit_hours" do
    get :edit_hours
    assert_response :success
  end

end
