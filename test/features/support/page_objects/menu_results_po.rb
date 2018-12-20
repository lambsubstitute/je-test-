# encoding: utf-8
# class documentation

class MenuResults
  include PageInitializer

  # HTML LOOKUPS
  MENU_DIV = 'serpImagesEnabled'
  RESULTS_HEADER_TEXT = 'searchHeading'
  CUISINEFILTER_UL = 'cuisineFilterList'
  OPTIONSFILTER_UL = /searchResults-refinements/
  CLOSEDRESTAURANTS_DIV = 'listingGroupClosed'
  LOADINGSPINNER_CLASS = /page--bgAlt is-loading is-loading--fixed is-loading--bgFade/
  SORTDROPDOWN = 'selectedSortOrder'
  SORTOPTIONSDIV = /popOver popOver--offset u-showBelowMidWide is-shown/
  SORTOPTIONSUL = /unstyled card card--small card--arrow card--arrow--right card--arrow--midWide/


  def waitWhileLoading
    @browser.body(class: LOADINGSPINNER_CLASS).wait_while_present
  end

  def presentForArea?(area)
    resultText = @browser.h1('data-test-id': RESULTS_HEADER_TEXT).text
    return resultText.include? area
  end

  def getTypeOptions
    @browser.ul('data-test': CUISINEFILTER_UL).wait_until_present
    @browser.ul('data-test': CUISINEFILTER_UL)
  end

  def getResultsHeaderText
    @browser.h1('data-test-id': RESULTS_HEADER_TEXT).text
  end

  def setOpenNowFilter
    @browser.ul(class: OPTIONSFILTER_UL).li('data-refine-by': 'isOpenNow').click
    waitWhileLoading
  end

  def closedRestaurantsPresent?
    @browser.div('data-test-id': CLOSEDRESTAURANTS_DIV).present?
  end

  def sortByAlphabetical
    @browser.span('data-test': SORTDROPDOWN).click
  end

  def waitForOptions
    @browser.div(:class, SORTOPTIONSDIV).wait_until_present
  end

  def getSortingOptions
    @browser.ul(:class, SORTOPTIONSUL)
  end

  def orderByAlphabetical
    options = getSortingOptions
    waitForOptions
    options.li(text: 'Restaurant name').click
  end

end