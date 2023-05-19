class AddStoryRequestIdToStories < ActiveRecord::Migration[7.0]
  def change
    add_reference :stories, :story_request, foreign_key: true
  end
end
