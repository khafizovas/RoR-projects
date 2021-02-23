#!env ruby
# frozen_string_literal: true

require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.navigate.to 'http://localhost:3000'

form = driver.find_element :tag_name, 'form'
form_submit = form.find_element name: :commit
form_submit.click

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
result = wait.until { driver.find_element(css: '#tbl_result') }
result = result.find_elements(css: 'td')
result = result.map(&:text)

raise 'Поле результата содержит некорректные данные' unless result == ["0", "0"]

driver.quit
