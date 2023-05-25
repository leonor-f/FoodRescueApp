Feature: Navigate through all different pages
  The search bar should appear on the bottom of the screen when I open the app

  Scenario: Be able to access the supermarkets page
    When I tap on the "store_page_button"
    Then I expect the "store_page" to be printed

  Scenario: Be able to access the products page
    When I tap on the "products_page_button"
    Then I expect the "products_page" to be printed

  Scenario: Be able to access the shopping list page
    When I tap on the "items_page_button"
    Then I expect the "items_page" to be printed

  Scenario: Be able to access favorite supermarkets' page
    When I tap on the "favorites_page_button"
    Then I expect the "favorites_page" to be printed