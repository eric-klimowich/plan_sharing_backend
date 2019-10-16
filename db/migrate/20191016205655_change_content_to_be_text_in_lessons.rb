class ChangeContentToBeTextInLessons < ActiveRecord::Migration[5.2]
  def change
    change_column :lessons, :content, :text
  end
end
