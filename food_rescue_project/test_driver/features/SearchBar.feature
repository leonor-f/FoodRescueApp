Feature: Use search bar
  The search bar should appear on the bottom of the page when we open the app

  Scenario: Map viewer with a pin in user's present location appears when the user opens the app
    When I open the app
    Then I expect the initial map with a pin on current location and nearby supermarkets (if existing) to be presented.
    
  Scenario: Be able to access the Map page
    Given I oppened the app
    And I used the search bar to access other page than the one with the map that is presented initialy
    When I tap the button on the search bar that contains the text "Lojas"
    Then I expect the map with a pin on current location and nearby supermarkets (if existing) to be presented.
    
  Scenario: Be able to access the page with the list of products intended to be bought
    When I open the app
    And I tap the button on the search bar that contais the text "Items"
    Then I expect the list of products that were added to the list of them that I want to buy to be presented with the name of the product, expiration date, supermarket name, icon and location.
    
  Scenario: Be able to access favorite supermarkets' page
    When I open the app
    And I tap the button on the search bar that contains the text "Favoritos"
    Then I expect the list of supermarkets that were added to favorites to be presented with their names, location and icon.
    
