class HomeController < ActionController::Base

  layout 'main'

  def index
  if user_signed_in?
  @allprojects = Project.all
  @myprojects = current_user.projects
  respond_to do |format|
  format.html
  end
  else
    redirect_to user_session_path
  end

  end
end

