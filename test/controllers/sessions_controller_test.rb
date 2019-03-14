require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "successful sign-in" do
    user = users(:one)
    user.password = "secret"
    user.save

    post sign_in_url, params: { email: user.email, password: "secret" }
    assert_redirected_to root_url
    assert_equal "Successfully signed in.", flash[:notice]
  end

  test "failed sign-in" do
    post sign_in_url, params: { email: "foo@email.com", password: "foo" }
    assert_redirected_to sign_in_url
    assert_equal "Sign in failed. Please confirm your email and password.", flash[:alert]
  end
end
