Feature: Modify shopping list page
  I should be able to add and remove supermarket's products from the shopping list

  Scenario: Be able to add a product to the shopping list
    Given I am on the "products_page"
    When I tap on the "refeiçoes"
    And I tap on the "addbutton"
    Then I tap on the "items_page_button"
    Then I expect the "product_favorite" to be printed

  Scenario: Be able to remove a product from the shopping list
    Given I am on the "items_page"
    When I tap on the "trashbutton"
    Then I expect to open a "dialog_remove_product"
    And I tap on the "product_remove_confimartion"
    Then I expect the "product_favorite" to disapear