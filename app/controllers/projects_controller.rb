class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  before_filter :authenticate_user!

  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    if @project.author == current_user.id
      @project = Project.find(params[:id])
    else
      flash[:alert] = 'You do not have permission to access this page !'
      redirect_to projects_path
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.author = current_user
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render action: "new"
    end

  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    if @project.author == current_user.id
      @project.destroy
    else
      flash[:alert] = 'You do not have permission to access this page !'
      redirect_to projects_path
    end    
  end

  # POST /projects/1/add_user
  def user_add
    @project = Project.find(params[:id])
    @usr = User.find(params[:post]['user'])
    if @project.users.where(:id => @usr.id).exists? 
      respond_to do |format|
        format.html { redirect_to @project, notice: 'Opps ! This User is already assigned to your project.' }
      end
    else
      @project.users << @usr
      respond_to do |format|
        format.html { redirect_to @project, notice: '1 user added to your project.' }
      end
    end
  end

end

