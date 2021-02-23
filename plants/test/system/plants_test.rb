require "application_system_test_case"

class PlantsTest < ApplicationSystemTestCase
  setup do
    @plant = plants(:one)
  end

  # Должно создаваться новое растение с набором параметров
  test "creating a Plant" do
    visit plants_url
    click_on "New Plant"

    fill_in "Age", with: @plant.age
    fill_in "Autumn frequency", with: @plant.autumn_frequency
    fill_in "Height", with: @plant.height
    fill_in "Name", with: @plant.name
    fill_in "Spring frequency", with: @plant.spring_frequency
    fill_in "Summer frequency", with: @plant.summer_frequency
    fill_in "Winter frequency", with: @plant.winter_frequency
    click_on "Create Plant"

    assert_text "Plant was successfully created"
    click_on "Back"
  end

  # Должны обновляться данные существующего растения
  test "updating a Plant" do
    visit plants_url
    click_on "Edit", match: :first

    fill_in "Age", with: @plant.age
    fill_in "Autumn frequency", with: @plant.autumn_frequency
    fill_in "Height", with: @plant.height
    fill_in "Name", with: @plant.name
    fill_in "Spring frequency", with: @plant.spring_frequency
    fill_in "Summer frequency", with: @plant.summer_frequency
    fill_in "Winter frequency", with: @plant.winter_frequency
    click_on "Update Plant"

    assert_text "Plant was successfully updated"
    click_on "Back"
  end

  # Растение должно удаляться
  test "destroying a Plant" do
    visit plants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plant was successfully destroyed"
  end
end
