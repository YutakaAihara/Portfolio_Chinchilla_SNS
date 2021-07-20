require 'test_helper'

class Public::QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_questions_index_url
    assert_response :success
  end

  test "should get new" do
    get public_questions_new_url
    assert_response :success
  end

  test "should get show" do
    get public_questions_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_questions_edit_url
    assert_response :success
  end

end
