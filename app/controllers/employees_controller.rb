class EmployeesController < ApplicationController
    # after_action :verify_authorized
    def index
       @employees = Employee.all
    end

    def new
        @employee = Employee.new
        @divisions = Division.all
        @array = Division.all.map { |div| [div.name, div.id] }
    end

    def create
        @employee =  Employee.create(employee_params)
        redirect_to @employee
    end

    def show
        @employee = Employee.find(params[:id])
        @array = Project.all.map { |p| [p.name, p.id] }
    end

    def update
        @employee = Employee.find(params[:id])

        if @employee.update(employee_params)
        redirect_to @employee
        else
        render :edit
        end
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to root_path
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def add
        @employee = Employee.find(params[:id])
        @employee.projects.append(Project.find(params[:project_id]))
        @employee.save
        redirect_to @employee
    end

    def remove
        @employee = Employee.find(params[:id])
        @project = Project.find(params[:p_id])
        @employee.projects.delete(@project)
        @project.employees.delete(@employee)
        redirect_to @project
    end

    private
    def employee_params
        params.require(:employee).permit(:name, :division_id, :project_id)
    end
end
