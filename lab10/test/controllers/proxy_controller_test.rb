require 'test_helper'

class ProxyControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get proxy_input_url
    assert_response :success
  end

  test 'should get different responses for different requests' do
    get proxy_output_url, params: { n: 10, side: :browser }
    browser_response = @response

    get proxy_output_url, params: { n: 10, side: :server }
    server_response = @response

    get proxy_output_url, params: { n: 10, side: :xml }
    xml_response = @response

    assert_not_equal browser_response, server_response
    assert_not_equal browser_response, xml_response
    assert_not_equal server_response, xml_response
  end
end
