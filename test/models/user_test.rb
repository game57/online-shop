require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = users(:one)
    assert user.valid?
  end

  test "invalid without email" do
    user = users(:one)
    user.email = ""
    assert user.invalid?
    assert_equal ["Email is invalid"], user.errors.full_messages_for(:email)
  end

  test "invalid with email format" do
    user = users(:one)
    user.email = "aaa@bbb"
    assert user.invalid?
    assert_equal ["Email is invalid"], user.errors.full_messages_for(:email)
  end
end
