Feature: Modify bucket list
  I should be able to add and remove products from my bucket list

  Scenario: Be able to remove a product from my bucket list
    Given I open the app
    And I tap on the "Items" button of the search bar
    When I tap on the trash can icon in front of the product that I do not want to buy
    Then I expect the items page to be updated without the product I removed.
