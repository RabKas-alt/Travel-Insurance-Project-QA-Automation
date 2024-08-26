@WelcomePage

Feature : Welcome Page Feature

  As a user, I want to have a welcome page after signing in, in order to easily navigate to key sections of the website

  Background:
    Given User is logged in to his account

  Scenario Outline:Complimentary buttons should work properly Under the "Welcome" page
    And   User is under the "Welcome" Page
    When  User clicks the "<Button>"
    Then  User <Outcome>

    Examples:
      | Button                   | Outcome                                              |
      | Coverage Letter          | gets redirected to the Coverage Letter page          |
      | Renew Global Travel Plus | gets redirected to the Renew Global Travel Plus page |
      | Travel Information       | gets redirected to the Travel Information page       |
      | Update your Information  | gets redirected to the Update your Information page  |
      | Log out                  | Signs out from the Welcome page                      |

  Scenario Outline: Confirm that the Profile icon takes the user back to the welcome page
    And   User is on the <Page> page
    When  User clicks on the Profile button
    Then  User should go back to the welcome page

    Examples:
      | Page                        |
      | Coverage Letter             |
      | Renew Global Travel Plus    |
      | Travel Information          |
      | Update Personal Information |

  Scenario Outline: Confirm or cancel the log out action
    And   User is at the welcome page
    And   User clicks the "Log Out" button
    When  User clicks on the <Button> button
    Then  User <Outcome>

    Examples:
      | Button  | Outcome                    |
      | Log out | signs out from his account |
      | Cancel  | stays at the welcome page  |
      | x       | closes the log out window  |

