@HomePage
Feature: Home Page Navigation
  As a user, I want to have an accessible home page for the Travel Insurance Website in order to:
  - Log in
  - See the information about the company

  Background:
    Given User is on the home page of the Travel Insurance Website

  Scenario Outline: Accessing the different sub-pages
    When  User clicks on <Button>
    Then  User should be redirected to the <Page> Page

    Examples:
      | Button                                                         | Page             |
      | the Discover Plans button                                      | Plans            |
      | the See All Services button                                    | Services         |
      | the Choose Your Plan button                                    | Plans            |
      | the Read More button of the "Travel Blog" section              | Travel Blog      |
      | the Read More button of the "Traveling with Your Pet?" section | Pet Assistance   |
      | a random card                                                  | card information |

  Scenario Outline: Navigating through the reviews

    And   User is viewing the <CurrentReview> reviews in the Review Section
    And   User <action>
    Then  User should see the <ExpectedReview> reviews

    Examples:
      | CurrentReview    | action                           | ExpectedReview   |
      | First and Second | clicks on the Right arrow button | Second and Third |
      | Second and Third | click on the Left arrow button   | First and second |
      | First and Second | swipes Right                     | Second and Third |
      | Second and Third | swipes Left                      | First and second |
      | First and Second | clicks on the Right slick slider | Second and Third |
      | Second and Third | clicks on the Left slick slide   | First and second |