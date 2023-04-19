Feature: Open favorite stores page
  The favorites page should appear when we click on "Favoritos"

  Scenario: Be able to access favorite supermarkets page
    Given I opened the app
    And I taped the button on the search bar that contains the text "Favoritos"
    Then I expect the list of supermarkets that were added to favorites to be presented with their names, location and icon.
    
  Scenario: Be able to remove a supermarket from the list of favorites
    Given I opened the app
    And I taped the button on the search bar that contains the text "Favoritos"
    When I tap the button "Remover dos Favoritos"
    Then I expect the favorites page to be updated without the supermarket selected to be removed.
    
    
