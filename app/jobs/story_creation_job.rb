class StoryCreationJob < ApplicationJob
  queue_as :default

  def perform(story_request)
    client = OpenAI::Client.new(access_token: ENV["OPEN_AI_SECRET"])
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [{ 
          role: "user", 
          content: "Crie uma história para colocar uma criança de #{story_request.age} anos para dormir contendo as seguintes palavras: #{story_request.keywords.join(", ")}"
        }],
        temperature: 0.7,
      }
    )

    Story.create!(
      story_request: story_request,
      body: response.dig("choices", 0, "message", "content"),
      keywords: story_request.keywords,
      age: story_request.age
    )
  end
end
