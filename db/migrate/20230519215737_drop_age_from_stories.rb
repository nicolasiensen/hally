class DropAgeFromStories < ActiveRecord::Migration[7.0]
  def change
    remove_column :stories, :age, :integer
  end
end
