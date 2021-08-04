require 'test_helper'

class Public::CommunitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_communities_index_url
    assert_response :success
  end

end
