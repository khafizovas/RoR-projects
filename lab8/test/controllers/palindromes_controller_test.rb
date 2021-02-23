require 'test_helper'

class PalindromesControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get palindromes_input_url
    assert_response :success
  end

  test 'should return error if params are empty' do
    get palindromes_view_url
    assert_response :success
    assert_not_nil assigns[:error]
    assert_nil assigns[:result]
  end

  test 'should return result if param is a number' do
    get palindromes_view_url, params: { n: '1' }
    assert_response :success
    assert_nil assigns[:error]
    assert_equal [{:dec=>"0", :bin=>"0"}], assigns[:result]
  end

  test 'should return error if param is not a number' do
    get palindromes_view_url, params: { n: 'qwerty' }
    assert_response :success
    assert_not_nil assigns[:error]
    assert_nil assigns[:result]
  end
end
