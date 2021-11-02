class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!

  def index
    @new_division = Division.new
  end
end
