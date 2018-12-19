require 'watir'
require 'rspec'
require 'rspec/expectations'
require 'cucumber'



Before do
  browser = Watir::Browser.new :chrome
  # we try and go to the page under test before anything else because if this does not work then whats the point of going further
  browser.goto(BASE_URL)
  @browser = browser

  #add the custom data locators
  buildCustomLocators
end


After do
  # clean up after each test, remove any session data etc
  @browser.cookies.clear
  @browser.close
end


at_exit do
  #clean up
  @browser.close
end


def buildCustomLocators
  # only declare this method AFTER browser has been initialised
  # define all the custom data lookups to be used later by page objects
  @browser.element(tag_name: 'data-test-id')
  @browser.element(tag_name: 'data-test')
  @browser.element(tag_name: 'data-refine-by')
end


# Allows browser object to be shared across page object classes without declaring it in every po
module PageInitializer
  # initializer for page objects, generic @browser initializer/parser
  def initialize(browser)
    @browser = browser
  end
end