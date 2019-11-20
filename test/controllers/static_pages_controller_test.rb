require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get impressum" do
    get static_pages_impressum_url
    assert_response :success
  end

  test "should get datenschutz" do
    get static_pages_datenschutz_url
    assert_response :success
  end

end
