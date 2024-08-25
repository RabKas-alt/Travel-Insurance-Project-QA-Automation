@Registration

Feature : Registration

  As a user, I want to have a Registration Page in order to pick my preferred plan, fill all the information and create an account

  Background:
    Given User started the registration process by secleting any plan


  Scenario Outline: Options can be selected from all the dropdowns under the registration page

    And   User is under the "<Section>" section
    And   User clicks on the "<Dropdown>" dropdown
    When  User selects an option from the dropdown
    Then  User sees the selected option

    Examples:

      | Section                         | Dropdown            |
      | Personal info Step 1            | Title               |
      | Personal info Step 1            | Suffix              |
      | Personal info Step 1            | Professional Suffix |
      | Personal info Step 1            | Country Code        | gets the list of Country Codes           |
      | Personal info Step 1            | Country             | gets the list of Countries               |
      | Insurance & Contact Info Step 2 | Country Code        | gets the list of Country Codes           |
      | Plan Type Step 3                | Plan Type           | gets the list of Plans                   |
      | Plan Type Step 3                | Plan                | gets the list of Expatriate Services     |
      | Plan Type Step 3                | Pet Plan            | gets the list of Pet Services            |
      | Plan Type Step 3                | Travel Location     | gets the list of all locations available |
      | Plan Type Step 3                | Travel Location     | gets the list of all locations available |
      | Plan Type Step 3                | Pet Type            | gets the list of the 2 types of pets     |
      | Plan Type Step 3                | Pet Gender          | gets the list of the 2 types of gender   |
      | Payment Info Step 4             | Pet Gender          | gets the list of the 2 types of gender   |

# Suggestion: Is it possible to adjust it from "Plan" to "Expatriate Plan" respecting the format of the pages, in the below section they called it Pet Plan



  Scenario Outline: If the input entered in the field is invalid, user gets an error message and can't proceed to Step 2

    And   User is under the <Section> section
    When  User enters "<InvalidInput>" in "<Field>"
    Then  User gets the error message "<ErrorMessage>"

    Examples:

      | Section                         | InvalidInput                    | Field                                                                        | ErrorMessage                                                                            |
      | Personal Info Step 1            |                                 | the First Name field                                                         | First Name is required                                                                  |
      | Personal Info Step 1            | a                               | the First Name field                                                         | First Name must be minimum 2                                                            |
      | Personal Info Step 1            | a                               | the Middle Name field                                                        | Middle Name must be minimum 2                                                           |
      | Personal Info Step 1            |                                 | the Last Name field                                                          | Last Name is required                                                                   |
      | Personal Info Step 1            | a                               | the Last Name field                                                          | Last Name must be minimum 2                                                             |
      | Personal Info Step 1            |                                 | the Phone Number field                                                       | Phone number is required                                                                |
      | Personal Info Step 1            | 888636755                       | the Phone Number field                                                       | Phone number is not valid                                                               |
      | Personal Info Step 1            |                                 | the Permanent Legal Residence field                                          | Permanent Legal Residence is required                                                   |
      | Personal Info Step 1            | a                               | the Permanent Legal Residence field                                          | Permanent Legal Residence must be minimum 2                                             |
      | Personal Info Step 1            |                                 | the Address field                                                            | Address is required                                                                     |
      | Personal Info Step 1            | a                               | the Address field                                                            | Address must be minimum 2                                                               |
      | Personal Info Step 1            |                                 | the City field                                                               | City is required                                                                        |
      | Personal Info Step 1            | a                               | the City field                                                               | City must be minimum 2                                                                  |
      | Personal Info Step 1            |                                 | the State field                                                              | State is required                                                                       |
      | Personal Info Step 1            |                                 | the Zip Code field                                                           | Zip Code is required                                                                    |
      | Personal Info Step 1            | a                               | the Address 2 field                                                          | Address must be minimum 2                                                               |
      | Personal Info Step 1            |                                 | the Email Address field                                                      | Email Address is required                                                               |
      | Personal Info Step 1            | @.co                            | the Email Address field                                                      | Invalid Email                                                                           |
      | Personal Info Step 1            | rabih.kassar@gotocme.com        | the Email Address field                                                      | Email is already in use                                                                 |
      | Personal Info Step 1            |                                 | the Confirm Email Address field                                              | Confirm Email Address is required                                                       |
      | Personal Info Step 1            | not matching confirmation email | the Confirm Email Address field                                              | Confirm Email Address must match                                                        |
      | Personal Info Step 1            |                                 | All mandatory fields                                                         | Please ensure all fields are filled in before proceeding.                               |
      | Insurance & Contact Info Step 2 |                                 | the Health Insurance provider field                                          | Health Insurance provider is required                                                   |
      | Insurance & Contact Info Step 2 | a                               | the Health Insurance provider field                                          | Health Insurance provider must be minimum 2                                             |
      | Insurance & Contact Info Step 2 |                                 | the Health Insurance Member Id field                                         | Health Insurance Member Id is required                                                  |
      | Insurance & Contact Info Step 2 | a                               | the Health Insurance Member Id field                                         | Health Insurance Member Id must be minimum 2                                            |
      | Insurance & Contact Info Step 2 | A                               | the Emergency Contact Name field                                             | Emergency Contact Name must be minimum 2                                                |
      | Insurance & Contact Info Step 2 | A                               | the Emergency Contact Relationship field                                     | Emergency Contact Relationship must be minimum 2                                        |
      | Insurance & Contact Info Step 2 | A                               | the Phone Number field under Emergency Contact Information                   | Emergency Contact Relationship must be minimum 2                                        |
      | Insurance & Contact Info Step 2 |                                 | the Emergency Contact Relationship field after filling the Emergency Contact | Emergency Contact Relationship is required because you added an emergency contact name. |
      | Insurance & Contact Info Step 2 |                                 | the Phone Number field after filling the Emergency Contact                   | Phone number is required because you added an emergency contact name.                   |
      | Insurance & Contact Info Step 2 |                                 | All mandatory fields                                                         | Please ensure all fields are filled in before proceeding.                               |
      | Plan Type Step 3                |                                 | the First Name field under Second Participant                                | First Name is required                                                                  |
      | Plan Type Step 3                | a                               | the First Name field under Second Participant                                | First Name must be minimum 2                                                            |
      | Plan Type Step 3                |                                 | the Last Name field under Second Participant                                 | First Name is required                                                                  |
      | Plan Type Step 3                | a                               | the Last Name field under Second Participant                                 | Last Name must be minimum 2                                                             |
      | Plan Type Step 3                |                                 | the Birth Date field under Second Participant                                | Birth Date is required                                                                  |

    #Bug : If you enter only spaces in any of the input fields, such as typing 4 spaces in the name field, the system accepts it without displaying an error message.
    # Question when all the mandatory fields are missing there is an error message that show s up : Please ensure all fields are filled in before proceeding.
    # As soon as I enter the emergency contact Name , these 2 error messages show up immediately without pressing the Next Button : Emergency Contact Relationship is required because you added an emergency contact name. & Phone number is required because you added an emergency contact name.
    # Emergency contact: When you type one letter it doesn't give the errorr message : Emergency contact must be minimum 2

  Scenario Outline: If the input entered into a field is valid, then user can proceed to the "Insurance & contact Info" Section

    And   User is under the <Section> section
    When  User enters  "<ValidInput>" in the mendatory field "<MendatoryField>"
    And   User clicks the "Next" button
    Then  User proceeds to the next step

    Examples:
      | Section                         | ValidInput                                      | MendatoryField             |
      | Personal info Step 1            | Rabih                                           | First Name                 |
      | Personal info Step 1            | Kassar                                          | Last Name                  |
      | Personal info Step 1            | +18886367557                                    | Phone Number               |
      | Personal info Step 1            | 06/24/1992                                      | Date of Birth              |
      | Personal info Step 1            | 1234 Elm Street, Apt. 56, Springfield, IL 62701 | Permanent Legal Residence  |
      | Personal info Step 1            | 123 Maple Avenue, Toronto, ON M4B 1B3           | Address                    |
      | Personal info Step 1            | Toronto                                         | City                       |
      | Personal info Step 1            | Ontario (ON)                                    | State                      |
      | Personal info Step 1            | M4B 1B3                                         | Zip Code                   |
      | Personal info Step 1            | rabih.kassar@gotocme.com                        | Email                      |
      | Personal info Step 1            | rabih.kassar@gotocme.com                        | Confirmation Email         |
      | Insurance & Contact Info Step 2 | April                                           | Health Insurance Provider  |
      | Insurance & Contact Info Step 2 | A20000237849                                    | Health Insurance Member ID |

  Scenario Outline:Complimentary buttons should function properly

    And   User is under the <Section>
    When  User clicks the <Button>
    Then  User <Outcome>

    Examples:

      | Section                         | Button                                                   | Outcome                                          |
      | Personal info Step 1            | Next button                                              | proceeds to Insurance & Contact Info Step 2      |
      | Insurance & Contact Info Step 2 | Next button                                              | proceeds to Plan Type Step 3                     |
      | Insurance & Contact Info Step 2 | Previous button                                          | returns to Personal Info Step 1                  |
      | Plan Type Step 3                | Calendar                                                 | gets the calendar modal for the Travel Date from |
      | Plan Type Step 3                | Calendar                                                 | gets the calendar modal for the Travel Date To   |
      | Plan Type Step 3                | Next button                                              | proceeds to Payment Info Step 4                  |
      | Plan Type Step 3                | Previous button                                          | returns to Insurance & Contact Info Step 2       |
      | Plan Type Step 3                | Add Child Button under Family Coverage                   | Add a new Child Section                          |
      | Plan Type Step 3                | X Button under Family Coverage Next to the Child section | removes the selected Child section               |
      | Calendar Modal                  | Left arrow button                                        | returns to the previous month of the same year   |
      | Calendar Modal                  | Right arrow button                                       | proceeds to the next month of the same year      |
      | Calendar Modal                  | Clear button                                             | clears any selection made                        |

