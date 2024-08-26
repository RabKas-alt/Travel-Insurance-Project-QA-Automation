@WelcomePageRedirections

Feature : WebsiteRedirections Feature

  As a user, I want to confirm that after signing in, all buttons under the different sub-pages redirect me to their proper sections

  Background:
    Given User is logged in to his account

  Scenario Outline:Complimentary buttons should work properly under all pages

    And   User is under the <Page> Page
    When  User clicks <Button>
    Then  User <Outcome>

    Examples:

      | Page               | Button                         | Outcome                                                        |
      | Coverage Letter    | the download button            | gets the file downloaded                                       |
      | Coverage Letter    | on the file                    | opens the PDF file                                             |
      | Travel Information | the country selector dropdown  | gets the list of countries available                           |
      | Travel Information | on any  Continent              | gets the countries listed under that continent                 |
      | Travel Information | on any  Country                | gets redirected to the selected country profile page           |
      | Travel Information | on the Country Overview Button | gets redirected to the Country Details Section                 |
      | Travel Information | the People Button              | gets redirected to the Country Cultural Demography Section     |
      | Travel Information | the Cultural Etiquette Button  | gets redirected to the Country Cultural Dos and Taboos Section |
      | Travel Information | the Travel guide Button        | gets redirected to the Country Travel Information Section      |
      | Travel Information | the Health Advisory Button     | gets redirected to the Travel Information Section              |
      | Travel Information | Any Links from any section     | gets redirected to Page of the selected link                   |


  Scenario :Renewing the current plan to a new one

    And   User clicks the "Renew Global Travel Plus" button
    And   User modifies the current plan
    And   User fills the mandatory fields with valid data
    When  User clicks the "Enroll" button
    Then  User updates the plan

  Scenario :Confirming the total amount after updating the plan

    And   User clicks the "Renew Global Travel Plus" button
    And   User modifies his plan
    When  User gets to the Step 4 section
    Then  User sees the exact total amount of the selected plan

  Scenario :User can update the contact information

    And   User clicks the "Update your information" button
    And   User changes any field with valid data
    When  User clicks the "Save" button
    Then  The information should be updated