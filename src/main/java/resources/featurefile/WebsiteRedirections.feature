@websiteRedirections

Feature : WebsiteRedirections Feature

  As a user, I want to confirm that all the buttons under the different sub-pages function in order to be redirected to their proper sections

  Scenario Outline:Complimentary buttons should work properly under all pages
    Given User is not logged in to his account
    And   User is under the <Page> Page
    When  User clicks the "<Button>"
    Then  User <Outcome>

    Examples:

      | Page                    | Button                                     | Outcome                                                 |
      | About Us                | View Our Services button                   | gets redirected to the Services Page                    |
      | Why Choose              | Choose your plan button                    | gets redirected to the Plans Page                       |
      | Mobile App              | Youtube PLay button                        | starts the Company's Mobile Applications Video          |
      | Mobile App              | Share button                               | gets the Youtube link to share it via different methods |
      | Mobile App              | X button                                   | closes the Share section                                |
      | Mobile App              | Global Travel Plus button                  | gets redirected to the Company's Youtube Account        |
      | Mobile App              | Extended Travel Program button             | gets redirected to the Extended Travel Program Page     |
      | Mobile App              | Pet Assistance button                      | gets redirected to the Pet Assistance Page              |
      | Mobile App              | J1 Visa Service button                     | gets redirected to the J1 Visa Service Page             |
      | Extended Travel Program | J1 Visa Service button                     | gets redirected to the J1 Visa Service Page             |
      | Extended Travel Program | Pet Assistance button                      | gets redirected to the Pet Assistance Page              |
      | Extended Travel Program | Mobile App button                          | gets redirected to the Mobile App Page                  |
      | Pet Assistance          | Extended Travel Program button             | gets redirected to the Extended Travel Program Page     |
      | Pet Assistance          | J1 Visa Service button                     | gets redirected to the J1 Visa Service Page             |
      | Pet Assistance          | Mobile App button                          | gets redirected to the Mobile App Page                  |
      | J1 Visa Services        | Extended Travel Program button             | gets redirected to the Extended Travel Program Page     |
      | J1 Visa Services        | Pet Assistance button                      | gets redirected to the Pet Assistance Page              |
      | J1 Visa Services        | Mobile App button                          | gets redirected to the Mobile App Page                  |
      | Plans                   | Single Start Plan button                   | gets redirected to the Single Plan Registration Page    |
      | Plans                   | Dual Start Plan button                     | gets redirected to the Dual Plan Registration Page      |
      | Plans                   | Family Start Plan button                   | gets redirected to the Family Plan Registration Page    |
      | Travel Blog             | Any Blog Card                              | gets redirected to the full page of that card           |
      | FAQ                     | + button next to the question              | expands the question and the answer is displayed        |
      | FAQ                     | x button next to the question              | closes the expanded question                            |
      | FAQ                     | click here button under the first question | gets redirected to the Services Page                    |
      | FAQ                     | here button under the fourth question      | gets redirected to the Extended Travel Program Page     |
      | Contact Us              | Location Marker                            | gets redirected to the Company's Google Maps page       |
      | Contact Us              | Phone                                      | gets the option to call the company's contact number    |
      | Contact Us              | Envelope                                   | gets the options to send an email                       |
      | Contact Us              | Country code dropdown                      | gets the country codes listed                           |
      | Contact Us              | X button of the error pop up message       | closes the error message                                |


  Scenario Outline: Scanning the QR code redirects the user to the Specific Store to download the app
    Given User is at the "Mobile App" Page
    And   User is using a <DeviceType> device
    When  User scans the QR Code
    Then  User should be redirected to the <StoreType> Store

    Examples:
      | DeviceType | StoreType   |
      | IOS        | Apple       |
      | Android    | Google Play |

  Scenario : Navigating through the FAQ questions
    Given User is on the "FAQ"  Page
    And   any seclected question is expanded
    When  User expands another question
    Then  The previous question is automatically closed

  Scenario Outline: If the input entered is invalid under the "Contact us" page, an error message should show
    Given User is on the Contact Us page
    And   User enters "<Input>" in the <Field>
    When  User clicks on the "Send Message" button
    Then  the "<Error>" shows under the Email Field

    Examples:

      | Input     | Field                  | Error                     |
      |           | Your Name field        | Name is required          |
      | a         | Your Name field        | Name is too short         |
      |           | Email field            | Email is required         |
      | @.com     | Email field            | Invalid email format      |
      |           | Phone Number field     | Phone number is required  |
      | 888636755 | Phone Number field     | Phone number is not valid |
      |           | Phone Number field     | Phone number is required  |
      | Hello     | Comment/Question field | Message is too short      |
      |           | Comment/Question field | Message is required       |

    #the minimum for the Comment/Question is 2 words

  Scenario Outline: If the input entered is valid under the contact us page,user can send the message
    Given User is on the Contact Us page
    And   User enters "<Input>" in the <Field>
    And   Fills in the others fields with valid data
    And   The CAPTCHA is verified
    When  User clicks on the "Send Message" button
    Then  The message is sent

    Examples:

      | Input                                                               | Field                  |
      | ab                                                                  | Your Name field        |
      | AB                                                                  | Your Name field        |
      | RABIH@@                                                             | Your Name field        |
      | RABIH@@  Kassar                                                     | Your Name field        |
      | 012345678901234567890123456789012345678901234567890123456789        | Your Name field        |
      | ## "Rabih"  $$                                                      | Your Name field        |
      | user@example.com                                                    | Email field            |
      | USER$$!!__@EXAMPLE>COM                                              | Email field            |
      | +18886367557                                                        | Phone Number field     |
      |                                                                     | Comment/Question field |
      | Hello                                                               | Comment/Question field |
      | Hello team                                                          | Comment/Question field |
      | Hello team  @#4 ASE!@DASDPCMIWE<PQWDASDIIQWEL>DAWEooQWEDQWEIIDMQDDE | Comment/Question field |


    # The minimum for the Comment/Question is 2 words
    # The maximum characters for the name is 60
    # Don't forget the letter with accents example: blé
    # Bug: When you click on "Space" or "Enter" many times in the Comment/Question Section it takes it, is this normal?

