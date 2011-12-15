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
    
    fill_in "project_deadline", :with => "12/11/2012"
    
    click_button('Create Project')

    page.should have_content("Project was successfully created.")
    
    

  end
  
  
  it "should allow authenticated user to assign task to project users" do
      
      auser = Factory(:user,:email => "ss@ss.ss")
      buser = Factory(:user,:email =>"buser@example.com")
      
      project = Factory(:project)
      project.author = auser
      project.users << buser
 
      login(auser)
      
      visit project_path(project)

      fill_in "Name", :with => "new Task"
      fill_in "Description", :with => "this is description of new Task"
      
      click_button('Create Task')
      
      page.should have_content("new Task")

    end
    
    # it "should not allow other user than author to edit or destroy project" do
    # 
    #     auser = Factory(:user,:email => "ss@ss.ss")
    #     buser = Factory(:user,:email =>"buser@example.com")
    # 
    #     project = Factory(:project)
    #     project.author = auser
    # 
    # 
    #     login(buser)
    # 
    #     visit edit_project_path(project)
    # 
    #     page.should have_content("You do not have permission to access this page !")
    # 
    #   end
    
end