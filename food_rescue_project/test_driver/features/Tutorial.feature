Feature: See a tutorial of the app features
  A tutorial about the use of the app should appear on the screen when I open it the first time

  Scenario: Be able to see a tutorial about the app
    When I open the app for the first time
    Then I expect to see a tutorial explaining how to use the app.