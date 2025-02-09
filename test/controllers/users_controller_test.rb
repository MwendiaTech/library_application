require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :users

  test "should get profile when logged in" do
    sign_in users(:one)
    get profile_path
    assert_response :success
    assert_select "h1", "Your Borrowed Books"
  end

  test "should redirect profile when not logged in" do
    get profile_path
    assert_redirected_to new_user_session_path
  end
end
