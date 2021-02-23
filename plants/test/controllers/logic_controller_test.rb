require 'test_helper'

class LogicControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @plant = plants(:one)
  end

  # Должна открываться страница с вводом данных для вычисления графика полива по соответствующему
  # запросу
  test "should get calc_watering" do
    get watering_url, params: { plant: { winter_frequency: @plant.winter_frequency, spring_frequency: @plant.spring_frequency, summer_frequency: @plant.summer_frequency, autumn_frequency: @plant.autumn_frequency } }
    assert_response :success
  end

end
