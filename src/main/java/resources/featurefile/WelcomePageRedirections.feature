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

      | Page               | Button                        | Outcome                                              |
      | Coverage Letter    | the download button           | gets the file downloaded                             |
      | Coverage Letter    | on the file                   | opens the PDF file                                   |
      | Travel Information | the country selector dropdown | gets the list of countries available                 |
      | Travel Information | on any  continent             | gets the countries listed under that continent       |
      | Travel Information | on any  country               | gets redirected to the selected country profile page |
      | Country Profile    | any news                      | see the country                                      |


