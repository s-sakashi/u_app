require "test_helper"

class HomePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_pages_home_url
    assert_response :success
    # assert_select "title", "U | 温泉情報サイト"
  end

  test "should get about" do
    get home_pages_about_url
    assert_response :success
  end
end
