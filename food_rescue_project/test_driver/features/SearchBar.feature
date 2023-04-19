Feature: Navigate through all different pages
  The search bar should appear on the bottom of the screen when I open the app

  Scenario: Be able to locate myself on the map
    When I open the app
    Then I expect to see the initial map with a pin on my current location and nearby supermarkets (if existing).
    
  Scenario: Be able to access the map page
    When I open the app
    And I tap on the "Lojas" button of the search bar
    Then I expect to see the map with a pin on the current location and nearby supermarkets (if existing).
    
  Scenario: Be able to access the bucket list page
    When I open the app
    And I tap on the "Items" button of the search bar
    Then I expect to see the list of products that I added to my bucket list with their name, quantity, old price, new price, expiration date, supermarket and respective icon.
    
  Scenario: Be able to access favorite supermarkets' page
    When I open the app
    And I tap on the "Favoritos" button of the search bar
    Then I expect to see the supermarkets that I added to my favorites list with their names, location and icon.
    
