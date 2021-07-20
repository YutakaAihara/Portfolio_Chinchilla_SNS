require 'test_helper'

class Public::FavoritePostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_favorite_posts_index_url
    assert_response :success
  end

end
