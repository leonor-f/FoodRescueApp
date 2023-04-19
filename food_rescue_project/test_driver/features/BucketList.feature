Feature: Open bucket list page
  The bucket list page should appear when we click on "Items"

  Scenario: Be able to access bucket list page
    Given I opened the app
    And I clicked on the button on the search bar that contains the text "Items"
    Then I expect to see the list of products that I added to my bucket list with its name, quantity, old price, new price, expiration date, supermarket and respective icon.
