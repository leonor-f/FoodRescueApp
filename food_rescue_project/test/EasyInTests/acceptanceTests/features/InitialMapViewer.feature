Feature: InicialMapViewer
  The Map Viewer with user's location should appear when the app is opened.

  Scenario: Map viewer with a pin in user's present location appears when the user opens the app
    When I open the app
    Then I wait until the initial map is present
