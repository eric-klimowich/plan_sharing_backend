class RenameUserIdToSubjectId < ActiveRecord::Migration[5.2]
  def change
    rename_column :lessons, :user_id, :subject_id
  end
end
