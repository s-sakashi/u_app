require "test_helper"

class HomePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "U - 温泉情報サイト"
  end

  test "should get about" do
    get about_url
    assert_response :success
  end
end
