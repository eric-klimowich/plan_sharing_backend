class AddSubjectTitleToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :subject_name, :string
  end
end
