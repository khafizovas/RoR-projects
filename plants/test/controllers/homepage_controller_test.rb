require 'test_helper'

class HomepageControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  # Если пользователь авторизован, запрос на корень должен возвращать домашнюю страницу, причём пользователь
  # должен быть авторизован (последняя ссылка в шапке сайта - выход)
  test "should get homepage" do
    get root_url
    assert_response :success

    assert_select 'nav > a', 'Sign Out'
  end
end
