class TasksController < ActionController::Base

  layout 'main'
  before_filter :authenticate_user!,:find_project

  def create
     @task = @project.tasks.build(params[:task])
     @task.user_id = params[:task]['user_id']
      @task.save

     respond_to do |format|
      format.html {redirect_to project_path(@project)}
      format.js
       end
  end

  def find_project
    @project = Project.find(params[:project_id])
  end


end

