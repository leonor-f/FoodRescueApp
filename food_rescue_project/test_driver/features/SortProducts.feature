Feature: Sort products by price and expiration date
  I should be able to sort the products list by the sorting option I choose

  Scenario: Be able to sort products
    Given I open the app
    And I tap on the "Produtos" button of the search bar
    When I tap on one of the sorting options
    Then I expect the products page to be updated showing the sorted products.