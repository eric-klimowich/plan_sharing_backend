class RenameLessonsContentToDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column :lessons, :content, :description
  end
end
