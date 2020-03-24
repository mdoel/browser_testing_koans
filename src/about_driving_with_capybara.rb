# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/edgecase')
require File.expand_path(File.dirname(__FILE__) + '/browser')

# In previous tests, we used the WebDriver API. Now we begin using
# a higher level API named Capybara. It provides a domain specific
# language (DSL) that more closely matches how people talk about
# pages and abstracts away some of the finer details you need to
# manage when using WebDriver.

class AboutDrivingWithCapybara < Edgecase::Koan

  def test_capybara_can_drive_firefox
    page_visited = false

    Capybara.default_driver = :selenium
    assert_nothing_raised do
      visit BROWSER_KOAN_TEST_PAGE
      page_visited = true
    end
    assert_equal __(true), page_visited
  end

  def test_capybara_can_drive_chrome
    page_visited = false

    Capybara.default_driver = :selenium_chrome
    assert_nothing_raised do
      visit BROWSER_KOAN_TEST_PAGE
      page_visited = true
    end
    assert_equal __(true), page_visited
  end

  def test_capybara_can_drive_firefox_headless
    page_visited = false

    Capybara.default_driver = :selenium_headless
    assert_nothing_raised do
      visit BROWSER_KOAN_TEST_PAGE
      page_visited = true
    end
    assert_equal __(true), page_visited
  end

  def test_capybara_can_drive_chrome_headless
    page_visited = false

    Capybara.default_driver = :selenium_chrome_headless
    assert_nothing_raised do
      visit BROWSER_KOAN_TEST_PAGE
      page_visited = true
    end
    assert_equal __(true), page_visited
  end
end

