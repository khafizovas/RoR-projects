# frozen_string_literal: true

require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  test 'should get login' do
    get login_url
    assert_response :success
  end

  test 'should get logout' do
    get logout_url
    assert_response :redirect
    assert_redirected_to login_url
  end

  test 'should get register' do
    get register_url
    assert_response :success
  end

  test 'should login with good credentials' do
    post login_url, params: { login: users(:valid).login, password: VALID_PASSWORD }
    assert_response :redirect
    assert_redirected_to root_url
  end

  test 'should not login with bad credentials' do
    assert_raises 'InvalidHash' do
      post login_url, params: { login: users(:invalid).login, password: VALID_PASSWORD }
    end
  end
end
