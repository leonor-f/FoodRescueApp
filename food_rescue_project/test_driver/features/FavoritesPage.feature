Feature: Open favorite stores page
  The favorites page should appear when we click on "Favoritos"
    
  Scenario: Be able to remove a supermarket from the favorite list
    Given I open the app
    And I tap on the "Favoritos" button of the search bar
    When I tap on the "Remover dos Favoritos" button
    Then I expect the favorites page to be updated without the supermarket I removed.
