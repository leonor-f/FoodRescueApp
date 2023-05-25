Feature: Modify favorite stores page
  I should be able to add and remove supermarkets from the favorites list

  Scenario: Be able to add a supermarket to the favorites page
    Given I am on the "Specific_Store_page"
    When I tap on the "addfavoritestore"
    And I tap on the "favorites_page_button"
    Then I expect the "supermarket" to be printed

  Scenario: Be able to remove a supermarket from the favorites page
    Given I am on the "favorites_page"
    When I tap on the "remover_loja"
    Then I expect to open a "dialog_remove_product"
    And I tap on the "product_remove_confimartion"
    Then I expect the "supermarket" to disapear