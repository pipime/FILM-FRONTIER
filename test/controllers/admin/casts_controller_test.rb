require 'test_helper'

class Admin::CastsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_casts_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_casts_edit_url
    assert_response :success
  end

end
