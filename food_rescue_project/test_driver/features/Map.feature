Feature: Select supermarket of a certain location
  I should be able to select one supermarket based on its location

  Scenario: Be able to locate myself on the map
    Given I am on the "store_page"
    Then I expect the "map" to be printed
    And I expect to see the "currentlocation"