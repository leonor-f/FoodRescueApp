Feature: Use search bar
  The search bar should appear on the bottom of the page when we open the app

  Scenario: Map viewer with a pin in user's present location appears when the user opens the app
    When I open the app
    Then I wait until the initial map with current location and nearby supermarkets (if existing) is present.
    
  Scenario: Be able to see the products intended to be bought
    When I open the app
    And I tap the button that contais the text "Items"
    The list of products that were added to the list of them that I want to buy is present with the name of the product, expiration date, supermarket name, icon and location.
    
  Scenario: Be able to access favorite supermarkets' page
    When I open the app
    And I tap the button that contains the text "Favoritos" on bottom search bar
    Then the list of supermarkets that were added to favorites is present with their names, location and icon.
    
    
    
    

    
    
    
    

  
