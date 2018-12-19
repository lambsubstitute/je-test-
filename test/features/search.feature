@search
Feature: Use the website to find restaurants
	So that I can order food
	As a hungry customer
	I want to be able to find restaurants in my area


	Scenario: Search for restaurants in an area
		Given I want food in "Victoria Street, Beaconsfield 2015"
		When I search for restaurants
		Then I should see some restaurants in "Victoria Street, Beaconsfield 2015"


    Scenario: Search offers auto complete address suggestions
        When I enter the address "Victoria Street, Beaconsfield 2015"
        Then I should be offered address suggestions
        And those address suggestions should contain
      """
      Victoria Street
      Beaconsfield NSW 2015, Australia
      """

    Scenario: Search returns no results
        When I search for food in a location there are no restaurants
        Then I should not see any restaurants


    Scenario Outline: Search for restaurant in an area and food type
        When I search for food in "<post_code>"
        Then I should have some restaurants serving "<food_type>"
      Examples:
        |food_type  |post_code|
        |Thai       |Victoria Street, Beaconsfield 2015    |
        |Pizza      |Victoria Street, Beaconsfield 2015    |


    Scenario: search results are filterable by "open now"
      Given I have searched for food in "Victoria Street, Beaconsfield 2015"
      When I filter the results by open now
      Then I should only see open restaurants