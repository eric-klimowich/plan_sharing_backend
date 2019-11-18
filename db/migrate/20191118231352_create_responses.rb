class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.string :content
      t.integer :user_id
      t.integer :request_id

      t.timestamps
    end
  end
end
