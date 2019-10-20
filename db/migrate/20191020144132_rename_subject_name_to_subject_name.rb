class RenameSubjectNameToSubjectName < ActiveRecord::Migration[5.2]
  def change
    rename_column :subjects, :name, :subject_name
  end
end
