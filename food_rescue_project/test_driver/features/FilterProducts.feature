Feature: Filter products
  I should be able to filter the products list by the category I choose

  Scenario: Be able to filter products by category
    Given I open the app
    And I tap on the "Produtos" button of the search bar
    When I tap on one of the shown categories at the top of the products page
    Then I expect the products page to be updated showing only the products that belong to the category I selected.