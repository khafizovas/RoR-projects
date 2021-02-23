require 'test_helper'

class CalcControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get calc_index_url
    assert_response :success
  end

  test 'should get result' do
    get calc_result_path, params: { n: 5 }
    assert_response :success

    assert_select 'td', '11' # last result
  end

  test 'should return json' do
    get calc_result_path, params: { n: 5, format: 'json' }
    assert_response :success

    assert_includes @response.headers['Content-Type'], 'application/json'
  end

  test 'should return rss' do
    get calc_result_path, params: { n: 5, format: 'rss' }
    assert_response :success

    assert_includes @response.headers['Content-Type'], 'application/rss'
  end

  test 'should cache result in db' do
    assert_changes 'Result.count' do
      get calc_result_path, params: { n: 1001 }
    end
  end

  test 'should respond with different results' do
    get calc_result_path, params: { n: 5, format: 'json' }
    first = JSON.parse @response.body

    get calc_result_path, params: { n: 1, format: 'json' }
    second = JSON.parse @response.body

    refute_equal first, second
  end
end
