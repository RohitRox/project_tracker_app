require 'spec_helper'

describe "Login" do

  it "should allow authenticated users to login" do

    user = Factory(:user, :email => "user@example.com", :password => "example", :password_confirmation => "example")

    visit user_session_path

    fill_in "Email", :with => user.email

    fill_in "Password", :with => "example"

    click_button "Sign in"

    page.should have_content("Signed in successfully.")

  end

  it "should not allow unauthenticated users to login" do

    user = Factory(:user, :email => "user@example.com", :password => "example", :password_confirmation => "example")

    visit "/users/sign_in"

    fill_in "Email", :with => user.email

    fill_in "Password", :with => "mistake"

    click_button "Sign in"

    page.should have_content("Invalid email or password.")

  end

  it "should not allow unauthenticated users to access" do

    visit projects_path

    page.should have_content("You need to sign in or sign up before continuing.")

  end


end