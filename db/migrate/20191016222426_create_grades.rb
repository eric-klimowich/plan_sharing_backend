class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.string :grade_name
      t.integer :user_id

      t.timestamps
    end
  end
end
