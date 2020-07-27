class Department < ApplicationRecord
  has_many :projects
  has_many :users
  validates :department_name, presence: true
end
