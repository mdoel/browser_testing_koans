# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/edgecase')
require 'selenium-webdriver'

class AboutInteractingWithPages < Edgecase::Koan
  def on_browserkoans_test_page
    url = 'https://browserkoans.com/testpage.html'
    headless do |driver|
      driver.get url
      yield driver
    end
  end

  def test_you_can_fill_in_text_form_fields
    on_browserkoans_test_page do |driver|
      text_field = driver.find_element id: 'textentry'
      assert_equal '', text_field.attribute('value')
      text_field.send_keys 'Hello World'
      assert_equal 'Hello World', text_field.attribute('value')
    end
  end

  def test_you_can_check_checkboxes_in_forms
    on_browserkoans_test_page do |driver|
      checkbox = driver.find_element id: 'option-1'
      assert_nil checkbox.attribute('checked')
      checkbox.click
      assert_not_nil checkbox.attribute('checked')
    end
  end

  def test_you_can_fill_out_and_submit_entire_forms
    on_browserkoans_test_page do |driver|
      checkbox = driver.find_element id: 'option-1'
      text_field = driver.find_element id: 'textentry'
      submit = driver.find_element id: 'form-submit'
      checkbox_result = driver.find_element id: 'result-checkboxes'
      text_result = driver.find_element id: 'result-text'

      assert_equal "No options chosen", checkbox_result.text
      assert_equal "Nothing entered", text_result.text

      text_field.send_keys 'Hello World'
      checkbox.click
      submit.click

      assert_equal "Option 1 chosen", checkbox_result.text
      assert_equal "Hello World", text_result.text
    end
  end

  def test_you_can_invoke_existing_javascript_functions
    on_browserkoans_test_page do |driver|
      evidence = driver.find_element id: 'load-me-dynamically'
      before_invocation = evidence.text
      driver.execute_script "loadItDynamically();"
      after_invocation = evidence.text
      assert_equal true, before_invocation != after_invocation 
    end
  end
end