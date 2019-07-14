require 'test_helper'

class Admin::YearsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_years_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_years_edit_url
    assert_response :success
  end

end
