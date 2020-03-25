# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/edgecase')
require File.expand_path(File.dirname(__FILE__) + '/browser')


class AboutRSpecExpectations < Edgecase::Koan

  # In this koan, let's explore how to use RSpec Expectations along with
  # Capybara Matchers to assert things about the sites we visit.
  def test_capybara_can_check_path
    on_visiting_browserkoans_test_page do
      assert_equal __(true), page.has_current_path?(BROWSER_KOAN_TEST_PAGE)

      assert_nothing_raised do
        expect(page).to have_current_path(BROWSER_KOAN_TEST_PAGE)
      end

      assert_raise(__(RSpec::Expectations::ExpectationNotMetError)) do
        expect(page).to have_current_path('https://www.google.com')
      end

      # Note there are two variants. In the first, we use Capybara::SessionMatcher's
      # has_current_path? method to get a boolean result. In the second, we establish
      # an RSpec expectation that raises an error if the expectation is not met.

    end
  end

  def test_what_are_these_rspec_expectations
    on_visiting_browserkoans_test_page do
      # In our last example, we saw that we can use Expectations. In automating browser
      # tests, these kinds of expectations can be a concise way of checking behavior.
      #
      # But what is really going on here? When the RSpec::Expectations module is included, you get
      # the expect method. Calling it returns something capable of generating that
      # expectation behavior. Let's see what it is.
      expectation_class = expect(page).class
      assert_equal(__(RSpec::Expectations::ExpectationTarget),expectation_class)

    end
  end

  def test_expecations_methods_make_for_readable_code
    on_browserkoans_test_page do
      # These expectation targets make it easy to write very readable code with
      # just a few methods. We saw above that it responds to the "to" method.
      expectation_methods = expect(page).methods
      assert_equal __(true), expectation_methods.include?(:to)
      assert_equal __(true), expectation_methods.include?(:not_to)
      assert_equal __(true), expectation_methods.include?(:to_not)
    end
  end

  def test_expecations_can_also_wrap_blocks
    # In addition to wrapping an object, we can wrap blocks in expectations
    error_raised = true
    expect do
      raise StandardError
      error_raised = false
    end.to raise_error
    assert_equal __(true), error_raised
  end

  # We can use these expectations to assert something affirmative
  def test_capybara_can_find_element
    on_visiting_browserkoans_test_page do
      assert_equal __(true), page.has_selector?('#mypara')
      assert_nothing_raised do
        expect(page).to have_selector('#mypara')
      end
    end
  end

  # We can also use the expectations to ensure a necessary negative
  def test_capybara_can_ensure_something_is_not_found
    on_visiting_browserkoans_test_page do
      assert_equal __(false), page.has_selector?('#not-there')
      assert_nothing_raised do
        expect(page).to_not have_selector('#not-there')
      end
    end
  end
end