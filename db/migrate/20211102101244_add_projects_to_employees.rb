class AddProjectsToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_reference :employees, :project, foreign_key: true, null: true
  end
end
