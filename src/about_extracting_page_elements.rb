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

  LINK_SELECTOR = ".div-with-link a"

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

end
