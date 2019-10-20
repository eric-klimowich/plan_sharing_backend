class RemoveUserIdFromSubjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :subjects, :user_id, :integer
  end
end
