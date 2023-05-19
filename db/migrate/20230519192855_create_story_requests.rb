class CreateStoryRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :story_requests do |t|
      t.text :keywords, null: false, array: true
      t.integer :age, null: false

      t.timestamps
    end
  end
end
