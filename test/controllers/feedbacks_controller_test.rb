require "test_helper"

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get feedbacks_create_url
    assert_response :success
  end
end
