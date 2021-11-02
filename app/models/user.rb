class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [:hr_manager, :project_manager, :employee]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
