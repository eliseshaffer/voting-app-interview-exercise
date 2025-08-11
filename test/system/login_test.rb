require "application_system_test_case"

class LoginTest < ApplicationSystemTestCase
  test "visiting the login page" do
    visit login_path
    
    assert_selector "h1", text: "Sign In To Vote"
    assert_selector "input[type=email]#email"
    assert_selector "input[type=password]#password"
    assert_selector "input[type=text]#zipCode"
    assert_selector "button[type=submit]", text: "Login"
  end

  test "submitting the login form" do
    visit login_path
    
    fill_in "email", with: "user@example.com"
    fill_in "password", with: "password123"
    fill_in "zipCode", with: "12345"
    
    click_button "Login"
    
    assert_current_path root_path
    assert_text "Login successful!"
  end
end
