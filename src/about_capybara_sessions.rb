# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/edgecase')
require File.expand_path(File.dirname(__FILE__) + '/browser')

class AboutCapybaraSessions < Edgecase::Koan
  include Edgecase::CapybaraKoan

  # def test_session_is_initialized_for_us
  #   assert_not_nil Capybara::current_session
  # end

  # def test_current_session_is_accessible_via_page_object
  #   # The answer you want here is the page object
  #   assert_equal __(page), Capybara::current_session

  #   # Let's see what type of ojbect this is
  #   assert_equal __(Capybara::Session), page.class
  # end

  GOOGLE = 'https://www.google.com/'
  MICROSOFT = 'https://www.microsoft.com/en-us/'
  # def test_session_is_used_for_navigation
  #   visit GOOGLE
  #   visit MICROSOFT
  #   go_back
  #   expect(page).to have_current_path(__(GOOGLE))
  # end

  # def test_session_can_refresh_the_browser
  #   visit GOOGLE
  #   refresh
  #   expect(page).to have_current_path(__(GOOGLE))
  # end

  def test_session_can_see_content_on_the_page
    visit GOOGLE
    expect(page).to have_text(/Advertising/)
  end
end