require 'test_helper'

class Public::ChinchillasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_chinchillas_index_url
    assert_response :success
  end

  test "should get new" do
    get public_chinchillas_new_url
    assert_response :success
  end

  test "should get show" do
    get public_chinchillas_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_chinchillas_edit_url
    assert_response :success
  end

end
