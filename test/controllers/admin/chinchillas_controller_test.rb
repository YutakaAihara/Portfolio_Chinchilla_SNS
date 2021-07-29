require 'test_helper'

class Admin::ChinchillasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_chinchillas_index_url
    assert_response :success
  end

end
