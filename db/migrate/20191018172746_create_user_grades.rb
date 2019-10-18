class CreateUserGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :user_grades do |t|
      t.integer :user_id
      t.integer :grade_id

      t.timestamps
    end
  end
end
