class RenameLessonsSubjectIdToUserGradeSubjectId < ActiveRecord::Migration[5.2]
  def change
    rename_column :lessons, :subject_id, :user_grade_subject_id
  end
end
