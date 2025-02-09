require "test_helper"

class UserTest < ActiveSupport::TestCase
  fixtures :users

  test "should be valid" do
    user = users(:one)
    assert user.valid?
  end

  test "should require an email" do
    user = users(:one)
    user.email = ""
    assert_not user.valid?
  end

  test "email should be unique" do
    user = users(:one)
    duplicate_user = user.dup
    user.save!
    assert_not duplicate_user.valid?
  end
end
