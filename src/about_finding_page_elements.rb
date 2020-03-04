# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/edgecase')
require 'selenium-webdriver'

class AboutFindingPageElements < Edgecase::Koan
  def on_browserkoans_test_page
    url = 'https://browserkoans.com/testpage.html'
    headless do |driver|
      driver.get url
      yield driver
    end
  end

  def test_find_an_element_by_id
    element_found = false
    on_browserkoans_test_page do |driver|
      assert_nothing_raised do
        the_element = driver.find_element(id: 'mypara')
        element_found = true
      end
    end
    assert_equal __(true), element_found
  end

  def test_trying_to_find_something_that_is_not_on_the_page
    element_found = false
    on_browserkoans_test_page do |driver|
      assert_raise(__(Selenium::WebDriver::Error::NoSuchElementError)) do
        the_element = driver.find_element(id: 'this-is-not-present')
        element_found = true
      end
    end
    assert_equal __(false), element_found
  end

  def test_find_elements_via_hash_syntax
    element_found = false
    on_browserkoans_test_page do |driver|
      assert_nothing_raised do
        the_element = driver['mypara']
        element_found = true
      end
    end
    assert_equal __(true), element_found
  end

  def test_find_multiple_elements_by_class
    the_elements = []
    on_browserkoans_test_page do |driver|
      the_elements = driver.find_elements(class: 'myclass')
    end
    assert_equal __(2), the_elements.size
  end


  def test_find_elements_by_tag_name
    the_elements = []
    on_browserkoans_test_page do |driver|
      the_elements = driver.find_elements(tag_name: 'p')
    end
    assert_equal __(11), the_elements.size
  end

  LINK_SELECTOR = ".p-with-link a"

  def test_find_elements_by_css_selector
    the_elements = []
    on_browserkoans_test_page do |driver|
      the_elements = driver.find_elements(css: LINK_SELECTOR)
    end
    assert_equal __(1), the_elements.size
  end
end
