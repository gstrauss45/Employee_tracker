class DivisionsController < ApplicationController
    # after_action :verify_authorized
    def index
      @divisions = Division.all
    end

    def new
        @division = Division.new
    end

    def create
        @division =  Division.create(division_params)
        redirect_to @division
    end

    def show
        @division = Division.find(params[:id])
        @users = User.all
        @user = User.first
    end

    def update
        @division = Division.find(params[:id])

        if @division.update(division_params)
          redirect_to @division
        else
          render :edit
        end
    end

    def destroy
        @division = Division.find(params[:id])
        @division.destroy
        redirect_to root_path
    end

    def edit
        @division = Division.find(params[:id])
    end

    private
    def division_params
      params.require(:division).permit(:name)
    end
end
