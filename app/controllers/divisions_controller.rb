class DivisionsController < ApplicationController
    # after_action :verify_authorized
    def index
      @divisions = Division.all
      authorize @divisions || @divisions.first
    end

    def new
        @division = Division.new
        authorize @division
    end

    def create
        @division =  Division.create(division_params)
        authorize @division
        redirect_to @division
    end

    def show
        @division = Division.find(params[:id])
        authorize @division
        authorize @division
        @users = User.all
        @user = User.first
    end

    def update
        @division = Division.find(params[:id])
        authorize @division

        if @division.update(division_params)
          redirect_to @division
        else
          render :edit
        end
    end

    def destroy
        @division = Division.find(params[:id])
        authorize @division
        @division.destroy
        redirect_to root_path
    end

    def edit
        @division = Division.find(params[:id])
        authorize @division
    end

    private
    def division_params
      params.require(:division).permit(:name)
    end
end
