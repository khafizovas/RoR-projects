require 'test_helper'

class PlantTest < ActiveSupport::TestCase
  setup do
    @new_plant = plants(:one)
  end

  # Растение должно добавляться в базу данных
  test 'Add to DB' do
    @plant = Plant.create(user: users(:one), name: @new_plant.name, age: @new_plant.age, height: @new_plant.height, winter_frequency: @new_plant.winter_frequency, spring_frequency: @new_plant.spring_frequency, summer_frequency: @new_plant.summer_frequency, autumn_frequency: @new_plant.autumn_frequency)
    assert_not_nil Plant.find_by(name: @plant.name)
    assert Plant.where('name = ? and age = ?', @plant.name, @plant.age)
  end

  # Не должно происходить сохранение в базу данных растения, не принадлежащего пользователю
  test 'should not save with nil user' do
    assert Plant.create(user: nil).invalid?
  end
end
