@BottomBar

Feature : BottomBar Feature

  As a user, I want to have a bottom bar in order to access the below:

  - The Home Page
  - The Company's Social Media pages (Facebook, Linkedin, Instagram, Twitter)
  - The Privacy Policy Page
  - The Terms & Conditions Page
  - The Company Google Map Location Page
  - Contact the company via email and phone number

  Background:
    Given User is on any page of the company's website

  Scenario Outline:
    And   User scrolls to the bottom
    When  User clicks on the "<SocialMedia>" button
    And   User is <Status> to his account
    Then  User will <Outcome>

    Examples:

      | SocialMedia | Status        | Outcome                                           |
      | Facebook    | logged in     | automatically see the company's Facebook page     |
      | Facebook    | not logged in | be asked to log in to his Facebook account first  |
      | Linkedin    | logged in     | automatically see the company's Linkedin page     |
      | Linkedin    | not logged in | be asked to log in to his Linkedin account first  |
      | Instagram   | logged in     | automatically see the company's Twitter page      |
      | Instagram   | not logged in | be asked to log in to his Instagram account first |
      | Twitter     | logged in     | automatically see the company's Twitter page      |
      | Twitter     | not logged in | be asked to log in to his Twitter account first   |

  Scenario Outline: Complimentary buttons should work properly
    And   User scrolls to the bottom
    When  User clicks the "<Button>" button
    Then  User <Outcome>

    Examples:
      | Button             | Outcome                                              |
      | Company's Logo     | returns to the home page                             |
      | Phone              | gets the option to call the company's contact number |
      | Envelope           | gets the options to send an email                    |
      | Location Marker    | gets redirected to the Company's Google Maps page    |
      | Privacy Policy     | gets redirected to the Privacy Policy Page           |
      | Terms & Conditions | gets redirected to the Terms & Conditions Page       |