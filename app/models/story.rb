class Story < ApplicationRecord
  belongs_to :story_request
  
  validates :body, presence: true
end
