class TasksController < ActionController::Base

  layout 'main'
  before_filter :authenticate_user!,:find_project

  def create
    if @project.author == current_user.id
    @task = @project.tasks.build(params[:task])
    @task.user_id = params[:task]['user_id']
    @task.save

    respond_to do |format|
      format.html {redirect_to project_path(@project)}
      format.js
    end
  else
    flash[:alert] = 'You do not have permission to perform this action !'
    redirect_to project_path(@project)
  end
  end

  def find_project
    @project = Project.find(params[:project_id])
    @usr = find(params[:add])
  end


end

