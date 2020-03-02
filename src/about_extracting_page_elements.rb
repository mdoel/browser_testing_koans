# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/edgecase')
require 'selenium-webdriver'

class AboutExtractingPageElements < Edgecase::Koan
  def on_wikipedia_home_page
    url = 'https://en.wikipedia.org/wiki/Main_Page'
    headless do |driver|
      driver.get url
      yield driver
    end
  end

  def test_you_can_extract_the_page_title
    on_wikipedia_home_page do |driver|
      assert_match /Wikipedia/, driver.title
    end
  end

end
