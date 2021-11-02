class Employee < ApplicationRecord
  belongs_to :division
  has_many :projects
end
