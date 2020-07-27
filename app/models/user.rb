class User < ApplicationRecord
  has_and_belongs_to_many :projects
  belongs_to :department
  validates :first_name,:last_name, :department_id, presence: true
end
