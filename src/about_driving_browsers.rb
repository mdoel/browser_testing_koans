# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/edgecase')
require 'selenium-webdriver'

class AboutDrivingBrowsers < Edgecase::Koan

  # Before this can pass, you'll need to have geckodriver installed
  # and available on your PATH. If you are on a Mac and are using
  # Homebrew, you can:
  #
  #     brew install geckodriver
  #
  # If you are on Windows and are using chocolatey, you can:
  #
  #     choco install geckodriver
  #
  # If neither of those work, find documentation at:
  #
  #     https://github.com/mozilla/geckodriver
  def test_selenium_can_drive_firefox
      driver = Selenium::WebDriver.for :firefox
      driver.quit
  end

  # Before this can pass, you'll need to have chromedriver installed
  # and available on your PATH. If you are on a Mac and are using
  # Homebrew, you can:
  #
  #     brew install chromedriver
  #
  # If you are on Windows and are using chocolatey, you can:
  #
  #     choco install chromedriver
  #
  # If neither of those work, find documentation at:
  #
  #     https://chromedriver.chromium.org/
  def test_selenium_can_drive_chrome
    driver = Selenium::WebDriver.for :chrome
    driver.quit
  end

  # The above examples show how you can drive a browser through selenium
  # webdriver with all of the window chrome showing. But what about in
  # a Continuous Integration environment where you don't want that? Enter
  # headless mode.
  def test_selenium_can_drive_firefox_headless
    options = Selenium::WebDriver::Firefox::Options.new
    options.add_argument('--headless')
    driver = Selenium::WebDriver.for :firefox, options: options
    driver.quit
  end

  def test_selenium_can_drive_chrome_headless
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    driver = Selenium::WebDriver.for :chrome, options: options
    driver.quit
  end

end

