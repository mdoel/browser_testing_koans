# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/edgecase')

require 'selenium-webdriver'

class AboutDrivingBrowsers < Edgecase::Koan

  def test_selenium_can_drive_firefox
      driver = Selenium::WebDriver.for :firefox
      driver.quit
  end

  def test_selenium_can_drive_chrome
    driver = Selenium::WebDriver.for :chrome
    driver.quit
  end

end

