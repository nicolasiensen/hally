class DropKeywordsFromStories < ActiveRecord::Migration[7.0]
  def change
    remove_column :stories, :keywords, :text, array: true
  end
end
