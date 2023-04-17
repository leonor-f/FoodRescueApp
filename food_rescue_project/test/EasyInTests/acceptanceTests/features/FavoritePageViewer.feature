Feature: FavoritePageView
  The Favorites page should appear when the "Favoritos" button is pressed.

  Scenario: Favorites page appears when the "Favoritos" button is pressed
    When I open the app
    And I tap the button that contains the text "Favoritos"
    Then the list of supermarkets that were added to favorites is present with their names, location and icon.
    
  Scenario: Be able to remove a supermarket from the favorites
    Given I am in the favorites page
    And I tap the button "Remover dos Favoritos"
    Then the list of favorites is updated without the supermarket selected to be removed.
    
    
