class StoryRequest < ApplicationRecord
  has_one :story

  after_commit :enqueue_story_creation, on: :create

  def enqueue_story_creation
    StoryCreationJob.perform_later(self)
  end
end
