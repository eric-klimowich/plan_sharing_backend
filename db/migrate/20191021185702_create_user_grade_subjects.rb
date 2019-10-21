class CreateUserGradeSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_grade_subjects do |t|
      t.integer :user_grade_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
