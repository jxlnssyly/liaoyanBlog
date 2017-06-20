require 'test_helper'

class DriversControllerTest < ActionDispatch::IntegrationTest
  test "should get depart" do
    get drivers_depart_url
    assert_response :success
  end

end
