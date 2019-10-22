class AddColumnsToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :file, :text
    add_column :lessons, :file_name, :string
  end
end
