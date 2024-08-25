@SigninFeature
Feature : SignIn Feature

  As a user, I need the log in page in  order to access my account

  Background:
    Given User is on the log in page

  Scenario Outline: If the email entered is invalid, an error message should show when trying to continue
    And  User enters "<Email>" in the "Email" field
    When User clicks on the "Next" button
    Then the "<Error>" shows under the Email Field

    Examples:

      | Email                                    | Error                |
      |                                          | Email is required    |
      | a@b.co                                   | Email does not exist |
      | user@example.com                         | Email does not exist |
      | user123@example.com                      | Email does not exist |
      | user_special!#$%&'*+-/=?^_}~@example.com | Email does not exist |
      | user@subdomain.example.com               | Email does not exist |
      | user@local-part.com                      | Email does not exist |
      | an inactive user email                   | Email does not exist |
      | a canceled user email                    | Email does not exist |
      | a blocked user email                     | Email does not exist |
      | user@com                                 | Email does not exist |
      | @example.com                             | Email does not exist |
      | userexample.com                          | Email does not exist |

  Scenario Outline: The "Next" button shows the Password field when the email is entered correctly
    And   User enters <Email>" in the "Email" field
    When  User clicks on the "Next" button
    Then  The Password field should show

    Examples:

      | Email                  |
      | kantarsocial@gmail.com |
      | KANTARSOCIAL@GMAIL.COM |

  Scenario: Once the Password Field is displayed, the email can still be modified
    And   The Password field is showing
    When  User clicks on the "Change" Button
    Then  The email can be modified
    And   The Password field disappears

  Scenario: User signs in to his account when the entered credentials are valid
    And   User enters valid credentials
    When  User clicks on the "Log in" button
    Then  User is signed in to his account

  Scenario Outline: User can't sing to his account when Password is invalid
    And  User enters <Password> password
    When User clicks on the "Log in" button
    Then User gets the "<Error>" error

    Examples:
      | Password | Error                |
      | Empty    | Password is required |
      | Invalid  | Failed to log in     |

  Scenario: User can sign in to his account when the OTP is valid
    And   User clicks on "Log in using OTP"
    And   User enters a valid OTP
    When  User clicks on the "Verify" button
    Then  User is signed in to his account

  Scenario: User can sign in to his account using the Resent Valid OTP
    And   User clicks on "Log in using OTP"
    And   User asks to Resend OTP
    And   User enters the Resent valid OTP
    When  User clicks on the "Verify" button
    Then  User is signed in to his account

  Scenario Outline: User can't sign in to his account when OTP is invalid
    And   User clicks on "Log in using OTP"
    And   User enters an <InvalidOTP> OTP
    When  User clicks on the "Verify" button
    Then  User gets the "<Error>" error

    Examples:
      | InvalidOTP         | Error                        |
      | Empty              | OTP is required              |
      | Invalid            | Failed to log in             |
      | Less than 4 digits | OPT must be exactly 4 digits |
      | Old Valid OTP      | Failed to log in             |

  Scenario Outline: Complimentary buttons should work properly
    When  User clicks the <Button> button
    Then  User <Outcome>

    Examples:
      | Button                | Outcome                                     |
      | Forgot password?      | gets the "Email Sent Successfully" message  |
      | Log in using OTP      | displays the OTP section                    |
      | Resend                | gets the "Sent Successfully" pop up message |
      | Log in using password | displays the Password section               |

    