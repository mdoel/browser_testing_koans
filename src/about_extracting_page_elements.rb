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
      page_title = driver.title
      assert_match __(/Test Page/), page_title
    end
  end

  def test_you_can_extract_the_page_source
    on_browserkoans_test_page do |driver|
      page_source = driver.page_source
      assert_match __(/Test Page/), page_source
    end
  end

  
  def test_you_can_get_the_contents_of_a_found_element
    on_browserkoans_test_page do |driver|
      paragraph_text = driver.find_element(id: 'mypara').text
      assert_match __(/id of mypara/), paragraph_text
    end
  end
    
  def test_we_can_get_other_attributes_in_addition_to_text
    on_browserkoans_test_page do |driver|
      element = driver.find_element(css: ".p-with-link a")
      href = element.attribute("href")
      protocol = element.attribute("protocol")

      assert_equal __("http://rubykoans.com/"), href
      assert_equal __("http:"), protocol
    end
  end

end
