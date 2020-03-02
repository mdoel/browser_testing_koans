# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/edgecase')
require 'selenium-webdriver'

class AboutNavigation < Edgecase::Koan

  def test_navigating_to_google
    selenium do |driver|
      driver.navigate.to('https://www.google.com')
    end
  end

  def test_getting_the_current_url
    url = 'https://www.google.com/'
    selenium do |driver|
      driver.navigate.to(url)
      assert_equal(driver.current_url, url)
    end
  end

  def test_refreshing_the_page_leaves_you_in_the_same_place
    url = 'https://www.google.com/'
    selenium do |driver|
      driver.navigate.to(url)
      driver.navigate.refresh
      assert_equal(driver.current_url, url)
    end
  end

  def test_webdriver_can_navigate_to_multiple_pages
    url1 = 'https://www.google.com/'
    url2 = 'https://www.microsoft.com/en-us'
    selenium do |driver|
      driver.navigate.to(url1)
      driver.navigate.to(url2)
      assert_equal(driver.current_url, url2)
    end
  end

  def test_webdriver_can_navigate_backwards_in_history
    url1 = 'https://www.google.com/'
    url2 = 'https://www.microsoft.com/en-us'
    selenium do |driver|
      driver.navigate.to(url1)
      driver.navigate.to(url2)
      driver.navigate.back
      assert_equal(driver.current_url, url1)
    end
  end

  def test_webdriver_can_navigate_forward_in_history
    url1 = 'https://www.google.com/'
    url2 = 'https://www.microsoft.com/en-us'
    selenium do |driver|
      driver.navigate.to(url1)
      driver.navigate.to(url2)
      driver.navigate.back
      driver.navigate.forward
      assert_equal(driver.current_url, url2)
    end
  end
end
