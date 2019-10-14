class RemoveSubjectNameFromLessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :subject_name, :string
  end
end
