@TopBar
Feature: TopBar Navigation

  As a user, I want to have a common TobBar in order to access the below:
  - About page
  - Services page
  - Plans page
  - Travel Blog page
  - FAQ page
  - Contact Us page

  Background:
    Given User is on the home page of the website

  Scenario Outline: Confirm that the Logo icon takes the user back to the home page
    Given User is on <page> page of the website
    When  User clicks on the "GLOBAL TRAVEL PLUS" icon
    Then  User should go back to the home page of the website

    Examples:
      | page                    |
      | Homepage                |
      | About US                |
      | Why Choose              |
      | Services                |
      | Mobile App              |
      | Extended Travel Program |
      | Pet Assistance          |
      | J1 Visa Services        |
      | Plans                   |
      | Travel Blog             |
      | FAQ                     |
      | Contact Us              |
      | Log in                  |
      | Privacy Policy          |
      | Terms & Conditions      |

  Scenario Outline: Validate that the About and Services dropdowns open correctly
    When  User clicks on the <Dropdown> dropdown
    Then  User should see the <Options> options

    Examples:
      | Dropdown | Options                                                                                             |
      | About    | "About us" and the "Why Choose"                                                                     |
      | Services | "All Service", "Mobile App", "Extended Travel Program", "Pet Assistance" and the "J1 Visa Services" |

  Scenario Outline: Selecting an option from any dropdown menu redirects to its page
    And The <Dropdown Menu> dorpdown is open
    When  User selects the <Options> option
    Then  User should be redirected to the "<Page>" page

    Examples:
      | Dropdown Menu | Options                 | Page                    |
      | About         | About us                | About us                |
      | About         | Why Choose              | Why Choose              |
      | Services      | All Services            | All Services            |
      | Services      | Mobile App              | Mobile App              |
      | Services      | Extended Travel Program | Extended Travel Program |
      | Services      | Pet Assistance          | Pet Assistance          |
      | Services      | J1 Visa Services        | J1 Visa Services        |

  Scenario Outline: Navigating to different pages using buttons on the home page
    When  User clicks on the <Button> button
    Then  User should be redirected to the <Page> Page

    Examples:
      | Button      | Page        |
      | Plans       | Plans       |
      | Travel Blog | Travel Blog |
      | FAQ         | FAQ         |
      | Contact Us  | Contact Us  |
      | Log in      | Log in      |

  Scenario: Going from one section to another

    And User goes to any random page
    When User Selects any Section
    Then User should be redirected to its page