require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  def login
    @user = users(:valid)
    visit login_url

    fill_in 'Login', with: @user.login
    fill_in 'Password', with: VALID_PASSWORD

    click_on 'Save'
  end
end
