require File.expand_path(File.dirname(__FILE__) + '/edgecase')

HEADLESS=false

module Edgecase
  class Koan
    BROWSER_KOAN_TEST_PAGE = 'https://browserkoans.com/testpage.html'

    # Many of the examples make use of an example page on the
    # browserkoans.com web site.
    def on_browserkoans_test_page
      send(HEADLESS ? :headless : :headed) do |driver|
        driver.get BROWSER_KOAN_TEST_PAGE
        yield driver
      end
    end

    # For tests that don't use the browserkoans.com web
    # site, we can start our browser easily with this method.
    def selenium
      send(HEADLESS ? :headless : :headed) do |driver|
        yield driver
      end
    end
  end
end