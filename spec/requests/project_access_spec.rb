require 'spec_helper'

describe "Project_Access" do

  it "should not allow un-authenticated users to projects" do

    visit projects_path

    page.should have_content("You need to sign in or sign up before continuing.")

  end
  
  it "should allow authenticated users to create project" do

    user = Factory(:user,:email => "ss@ss.ss")
    
    login(user)
    
    visit new_project_path
    
    fill_in "Name",:with => "Hawaiii"
    
    fill_in "Description", :with => "Newtitle is here nsdkjkjsndckjbisnifbhiurf"
    
    fill_in "project_deadline", :with => "11-11-11"
    
    click_button('Create Project')

    page.should have_content("Project was successfully created.")

  end
  
  
  
  

end