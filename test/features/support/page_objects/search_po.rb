# encoding: utf-8
# class documentation

class Search
  include PageInitializer

  # HTML LOOKUPS
  SEARCH_TEXTFIELD = 'address'
  SUGGESTIONS_LIST = 'addressLookupSuggestions'


  def enterArea(area)
    @browser.text_field('data-test-id': SEARCH_TEXTFIELD).set area
  end

  def selectFirstAddressSuggestion
    @browser.ul('data-test-id': SUGGESTIONS_LIST).li(index: 0).click
  end

  def addressSuggestionsPresent?
    @browser.ul('data-test-id': SUGGESTIONS_LIST).wait_until_present
    @browser.ul('data-test-id': SUGGESTIONS_LIST).present?
  end

  def getAddressSuggestionsText
    @browser.ul('data-test-id': SUGGESTIONS_LIST).text
  end

end