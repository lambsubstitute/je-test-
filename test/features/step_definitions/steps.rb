Given(/I want food in "([^""]+)"/) do |area|
  fillInAreaCode(area)
end

When (/I search for restaurants/) do
  searchForFood
end

When (/I search for food in "([^""]+)"/) do |area|
  fillInAreaCode(area)
  searchForFood
end

Then (/I should see some restaurants in "([^""]+)"/) do |areaCode|
  checkForRestaurantsInArea(areaCode)
end

Then (/I should not see any restaurants/) do
  checkForNoResultsPage
end

Then (/I should have some restaurants serving "([^""]+)"/) do |foodType|
   checkForFoodType(foodType)
end

When(/^I enter the address "([^"]*)"$/) do |area|
  fillInAreaCode(area)
end

Then(/^I should be offered address suggestions$/) do
  addressSuggestionsPresent
end

And(/^those address suggestions should contain$/) do |address|
  addressSuggestionsContain(address)
end

Given(/^I have searched for food in "([^"]*)"$/) do |area|
  fillInAreaCode(area)
  searchForFood
end

When(/^I filter the results by open now$/) do
  filterByOpenNow
end

Then(/^I should only see open restaurants$/) do
  closedRestaurantsNotPresent
end

Given(/^I search for food in a location there are no restaurants$/) do
  fillInAreaCode('Curlew Street, Marla SA, Australia')
  searchForFood
end

When(/^I sort the results by alphabetical order$/) do
  sortResultsByAlphabetical
end

Then(/^the results should be sorted alphabetically$/) do
  sleep 10000
end