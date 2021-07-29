require 'test_helper'

class Admin::HospitalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_hospitals_index_url
    assert_response :success
  end

end
