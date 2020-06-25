require 'test_helper'

class Customers::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customers_genres_show_url
    assert_response :success
  end

end
