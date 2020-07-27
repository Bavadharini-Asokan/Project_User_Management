class Project < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :department
  validates :project_name, :department_id, presence: true
end
