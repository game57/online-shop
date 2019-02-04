require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  test "sign in" do
    user = users(:one)
    user.assign_attributes(email: "foo@email.com", password: "secret")
    user.save!

    visit sign_in_url

    assert_selector "h1", text: "Sign in"
    assert_selector :link, "or sign up", href: sign_up_path

    fill_in "Email", with: "foo@email.com"
    fill_in "Password", with: "secret"
    click_on "Sign in"
    assert_current_path root_path
    assert_selector "h1", text: "Welcome"
  end
end
