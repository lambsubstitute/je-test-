def fillInAreaCode(value)
  search = Search.new(@browser)
  search.enterArea(value)
end

def searchForFood
  search = Search.new(@browser)
  search.selectFirstAddressSuggestion
end

def checkForRestaurantsInArea(value)
  results = MenuResults.new(@browser)
  text = results.getResultsHeaderText
  result = text.include? value
  result.should == (true)
end

def checkForFoodType(value)
  results = MenuResults.new(@browser)
  options = results.getTypeOptions
  result = false
  #check each of the food types and check to see if the requested one is present
  options.lis.each do |foodType|
    if foodType.text.include? (value)
      result = true
    end
  end
  result.should == (true)
end

def checkForNoResultsPage
  noResults = NoResults.new(@browser)
  result = noResults.noResultsPresent?
  result.should == (true)
end

def addressSuggestionsPresent
  search = Search.new(@browser)
  result = search.addressSuggestionsPresent?
  result.should == (true)
end

def addressSuggestionsContain(address)
  search = Search.new(@browser)
  suggestions = search.getAddressSuggestionsText
  result = suggestions.include? address
  result.should == (true)
end

def filterByOpenNow
  filter = MenuResults.new(@browser)
  filter.setOpenNowFilter
end

def closedRestaurantsNotPresent
  results = MenuResults.new(@browser)
  present = results.closedRestaurantsPresent?
  present.should == (false)
end

def sortResultsByAlphabetical
  sortList = MenuResults.new(@browser)
  sortList.sortByAlphabetical
  sortList.orderByAlphabetical
end