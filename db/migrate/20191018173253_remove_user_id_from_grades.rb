class RemoveUserIdFromGrades < ActiveRecord::Migration[5.2]
  def change
    remove_column :grades, :user_id, :integer
  end
end
