require 'test_helper'

class Public::CommunityControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_community_index_url
    assert_response :success
  end

end
