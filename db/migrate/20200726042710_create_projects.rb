class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.integer :no_of_users
      t.integer :department_id

      t.timestamps
    end
  end
end
