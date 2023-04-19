Feature: Modify favorite stores page
  I should be able to add and remove supermarkets from the favorites list
    
  Scenario: Be able to remove a supermarket from the favorites list
    Given I open the app
    And I tap on the "Favoritos" button of the search bar
    When I tap on the "Remover dos Favoritos" button
    Then I expect the favorites page to be updated without the supermarket I removed.
