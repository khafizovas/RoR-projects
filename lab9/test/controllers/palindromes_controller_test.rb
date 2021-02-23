require 'test_helper'

class PalindromesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get palindromes_index_url
    assert_response :success
  end

end
