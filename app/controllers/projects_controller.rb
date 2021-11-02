class ProjectsController < ApplicationController
    # after_action :verify_authorized
    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.create(project_params)
        @project.save
        redirect_to @project
    end

    def show
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        if @project.update(project_params)
        redirect_to @project
        else
        render :edit
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to root_path
    end

    def edit
        @project = Project.find(params[:id])
    end

    private
    def project_params
        params.require(:project).permit(:name)
    end
end