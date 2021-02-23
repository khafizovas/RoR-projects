require 'test_helper'

class PlantsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @plant = plants(:one)
  end

  # Должна открываться страница со списком растений по соответствующему запросу
  test "should get index" do
    get plants_path
    assert_response :success
  end

  # Должно создаваться новое растение и происходить переадресация на страницу его просмотра по POST запросу
  test "should create plant" do
    assert_difference('Plant.count') do
      post plants_path(locale: 'en'), params: { plant: { name: @plant.name, age: @plant.age, height: @plant.height, winter_frequency: @plant.winter_frequency, spring_frequency: @plant.spring_frequency, summer_frequency: @plant.summer_frequency, autumn_frequency: @plant.autumn_frequency } }
    end

    assert_redirected_to plant_path(Plant.last)
  end

  # Растение должно быть доступно для просмотра
  test "should show plant" do
    get plant_path(locale: 'en', id: @plant)
    assert_response :success
  end

  # Растение должно удаляться и происходить переадресация на страницу со списком растений
  test "should destroy plant" do
    assert_difference('Plant.count', -1) do
      delete plant_path(locale: 'en', id: @plant)
    end

    assert_redirected_to plants_path
  end
end
