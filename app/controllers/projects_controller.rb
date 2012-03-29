class ProjectsController < ApplicationController
  before_filter :find_project, :only => [:show, :edit, :update, :destroy]
  respond_to :html, :xml

  def index
    @projects =  Project.select("id, name").includes(:tasks).page params[:page]
    respond_with(@projects)
  end

  def show
    respond_with(@project)
  end

  def edit
    3.times { @project.tasks.build } if @project.tasks.nil?
  end

  def update
    if @project.update_attributes(params[:project])
      flash[:notice] = 'project was successfully updated.'
    end
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  def new
    @project = Project.new
    3.times { @project.tasks.build }
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      ProjectMailer.new_project.deliver
      flash[:notice] = 'Project was successfully created.'
    end
    respond_with(@project)
  end

  protected

  def find_project
    @project = Project.find(params[:id])
  end

end
