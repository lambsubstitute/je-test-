# encoding: utf-8
# class documentation

class NoResults
  include PageInitializer

  # HTML LOOKUPS
  NORESULTS_HEADER = 'noResults'

  def waitForNoResultsPage
    @browser.h2('data-test-id': NORESULTS_HEADER).wait_until_present
  end

  def noResultsPresent?
    waitForNoResultsPage
    return @browser.h2('data-test-id': NORESULTS_HEADER).present?
  end


end