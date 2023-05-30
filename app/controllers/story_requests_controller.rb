class StoryRequestsController < ApplicationController
  def new
    @story_request = StoryRequest.new
    @keywords = Keyword.all.to_a.shuffle
  end

  def create
    @story_request = StoryRequest.new(story_request_params)

    if @story_request.keywords.nil?
      @story_request.keywords = Keyword.all.to_a.shuffle[0..2].map(&:text_pt_br)
    end

    if @story_request.save
      redirect_to @story_request
    else
      render :new
    end
  end

  def show
    @story_request = StoryRequest.find(params[:id])
    redirect_to @story_request.story if @story_request.story.present?
  end

  private

  def story_request_params
    params.require(:story_request).permit(:age, keywords: [])
  end
end
