# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/edgecase')
require 'selenium-webdriver'

class AboutExtractingPageElements < Edgecase::Koan
  def on_browserkoans_test_page
    url = 'https://browserkoans.com/testpage.html'
    headless do |driver|
      driver.get url
      yield driver
    end
  end

  def test_you_can_extract_the_page_title
    on_browserkoans_test_page do |driver|
      assert_match /Browser/, driver.title, /Browser/
    end
  end

  def test_you_can_extract_the_page_source
    on_browserkoans_test_page do |driver|
      assert_match /Test Page/, driver.page_source
    end
  end

  def test_the_driver_can_find_a_single_element_by_id
    on_browserkoans_test_page do |driver|
      assert_match /id of mypara/, driver.find_element(id: 'mypara').text
    end
  end

  def test_the_driver_can_find_a_single_element_by_id_by_acting_like_a_hash
    on_browserkoans_test_page do |driver|
      assert_match /id of mypara/, driver['mypara'].text
    end
  end

  def test_the_driver_can_find_multiple_elements_by_class
    on_browserkoans_test_page do |driver|
      assert_equal 2, driver.find_elements(:class, 'myclass').size
    end
  end

  def test_the_driver_can_find_elements_by_tag_name
    on_browserkoans_test_page do |driver|
      assert_greater_than 2, driver.find_elements(:tag_name, 'p').size
    end
  end

  LINK_SELECTOR = ".p-with-link a"

  def test_the_driver_can_find_elements_by_css_selector
    on_browserkoans_test_page do |driver|
      assert_match /rubykoans/, driver.find_element(css: LINK_SELECTOR).text
    end
  end

  def test_we_can_get_other_attributes_in_addition_to_text
    on_browserkoans_test_page do |driver|
      element = driver.find_element(css: LINK_SELECTOR)
      assert_equal "http://rubykoans.com/", element.attribute("href")
      assert_equal "http:", element.attribute("protocol")
    end
  end

  # Many, if not most, web applications now use javascript to provide
  # a more dynamic experience. When extracting page elements, we need
  # to be mindful that we might have to wait for a change to occur before
  # we can reason about what is on the page.
  def test_webdriver_does_not_wait_fory_dynamic_page_changes_by_default
    on_browserkoans_test_page do |driver|
      volatile_text = -> { driver['delayed-text'].text }
      assert_not_nil volatile_text.call[/Loading/]
      assert_nil volatile_text.call[/jQuery/]
    end
  end

  def wait_for(timeout,&block)
    wait = Selenium::WebDriver::Wait.new(:timeout => timeout)
    wait.until { yield }
  end

  def test_webdriver_can_be_made_to_wait
    saw_change = false
    on_browserkoans_test_page do |driver|
      volatile_text = -> { driver['delayed-text'].text }
      begin
        wait_for(10) { !volatile_text.call[/Loading/] }
        saw_change = true
      rescue Selenium::WebDriver::Error::TimeoutError => ex
      end
    end
    assert_equal true, saw_change
  end

  def test_webdriver_will_raise_an_exception_if_timeout_exceeded
    saw_change = false
    on_browserkoans_test_page do |driver|
      volatile_text = -> { driver['delayed-text'].text }
      begin
        wait_for(1) { !volatile_text.call[/Loading/] }
        saw_change = true
      rescue Selenium::WebDriver::Error::TimeoutError => ex
      end
    end
    assert_equal false, saw_change
  end
end
