require "test_helper"

class StoryRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get story_requests_new_url
    assert_response :success
  end

  test "should get create" do
    get story_requests_create_url
    assert_response :success
  end

  test "should get show" do
    get story_requests_show_url
    assert_response :success
  end
end
