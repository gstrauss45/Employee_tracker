class ProjectsController < ApplicationController
    # after_action :verify_authorized
    def index
        @projects = Project.all
        authorize @projects || @projects.first
    end

    def new
        @project = Project.new
        authorize @project
    end

    def create
        @project = Project.create(project_params)
        authorize @project
        @project.save
        redirect_to @project
    end

    def show
        @project = Project.find(params[:id])
        @array = Employee.all.map { |div| [div.name, div.id] }
        authorize @project
    end

    def update
        @project = Project.find(params[:id])
        authorize @project
        if @project.update(project_params)
        redirect_to @project
        else
        render :edit
        end
    end

    def destroy
        @project = Project.find(params[:id])
        authorize @project
        @project.destroy
        redirect_to root_path
    end

    def edit
        @project = Project.find(params[:id])
        authorize @project
    end

    def add
        @project = Project.find(params[:project_id])
        authorize @project
        @project.employees.append(Employee.find(params[:employee_id]))
        @project.save
        redirect_to @project
    end

    def remove
        @employee = Employee.find(params[:id])
        @project = Project.find(params[:p_id])
        @employee.projects.delete(@project)
        @project.employees.delete(@employee)
        redirect_to @employee
    end

    private
    def project_params
        params.require(:project).permit(:name)
    end
end
