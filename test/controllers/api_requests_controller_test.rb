require 'test_helper'

class ApiRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get connection" do
    get api_requests_connection_url
    assert_response :success
  end

end
