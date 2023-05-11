class CreateStories < ActiveRecord::Migration[7.0]
  def change
    create_table :stories do |t|
      t.text :body, null: false
      t.text :keywords, null: false, array: true
      t.integer :age, null: false

      t.timestamps
    end
  end
end
