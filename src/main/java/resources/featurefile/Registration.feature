@Registration

Feature : Registration

  As a user, I want to have a Registration Page in order to pick my preferred plan, fill all the information and create an account

  Background:
    Given User started the registration process by secleting any plan


  Scenario Outline: Options can be selected from all the dropdowns under any section

    And   User is under the <Section> section
    And   User clicks on the "<Dropdown>" dropdown
    When  User selects an option from the dropdown
    Then  User sees the selected option

    Examples:
      | Section                         | Dropdown            |
      | Personal Info Step 1            | Title               |
      | Personal Info Step 1            | Suffix              |
      | Personal Info Step 1            | Professional Suffix |
      | Personal Info Step 1            | Country Code        |
      | Personal Info Step 1            | Country             |
      | Personal Info Step 1            | Country Code        |
      | Insurance & Contact Info Step 2 | Country Code        |
      | Plan Type Step 3                | Plan Type           |
      | Plan Type Step 3                | Expatriate Plan     |
      | Plan Type Step 3                | Pet Plan            |
      | Plan Type Step 3                | Travel Location     |
      | Plan Type Step 3                | Pet Type            |
      | Plan Type Step 3                | Pet Gender          |
      | Payment Info Step 4             | Country             |

  Scenario Outline: Invalid inputs leads to error messages and user can't proceed to the "Insurance & contact Info Step 2" Section

    And   User is under the "Personal Info Step 1" section
    When  User enters "<InvalidInput>" in "<Field>" field
    Then  User gets the error message "<ErrorMessage>"

    Examples:
      | InvalidInput                    | Field                         | ErrorMessage                                              |
      |                                 | all the mandatory             | Please ensure all fields are filled in before proceeding. |
      |                                 | the First Name                | First Name is required                                    |
      | a                               | the First Name                | First Name must be minimum 2                              |
      | a                               | the Middle Name               | Middle Name must be minimum 2                             |
      |                                 | the Last Name                 | Last Name is required                                     |
      | a                               | the Last Name                 | Last Name must be minimum 2                               |
      |                                 | the Phone Number              | Phone number is required                                  |
      | 888636755                       | the Phone Number              | Phone number is not valid                                 |
      |                                 | the Permanent Legal Residence | Permanent Legal Residence is required                     |
      | a                               | the Permanent Legal Residence | Permanent Legal Residence must be minimum 2               |
      |                                 | the Address                   | Address is required                                       |
      | a                               | the Address                   | Address must be minimum 2                                 |
      |                                 | the City                      | City is required                                          |
      | a                               | the City                      | City must be minimum 2                                    |
      |                                 | the State                     | State is required                                         |
      |                                 | the Zip Code                  | Zip Code is required                                      |
      | a                               | the Address 2                 | Address must be minimum 2                                 |
      |                                 | the Email Address             | Email Address is required                                 |
      | @.co                            | the Email Address             | Invalid Email                                             |
      | rabih.kassar@gotocme.com        | the Email Address             | Email is already in use                                   |
      |                                 | the Confirm Email Address     | Confirm Email Address is required                         |
      | not matching confirmation email | the Confirm Email Address     | Confirm Email Address must match                          |

  Scenario : If the input entered in the field is valid, then user can proceed to the "Insurance & contact Info" Section

    And   User is under the "Personal info Step 1" section
    And   User fills in all mandatory fields with valid data
    When  User clicks the "Next" button
    Then  User proceeds to the "Insurance & contact Info" section


  Scenario Outline: Invalid input leads to error message and user can't proceed to the "Plan Type Step 3" Section

    And   User is under the "Insurance & Contact Info Step 2" section
    When  User enters "<InvalidInput>" in "<Field>"
    Then  User gets the error message "<ErrorMessage>"

    Examples:
      | InvalidInput | Field                                                                        | ErrorMessage                                                                            |
      |              | all the mandatory fields                                                     | Please ensure all fields are filled in before proceeding.                               |
      |              | the Health Insurance provider field                                          | Health Insurance provider is required                                                   |
      | a            | the Health Insurance provider field                                          | Health Insurance provider must be minimum 2                                             |
      |              | the Health Insurance Member Id field                                         | Health Insurance Member Id is required                                                  |
      | a            | the Health Insurance Member Id field                                         | Health Insurance Member Id must be minimum 2                                            |
      | a            | the Emergency Contact Name field                                             | Emergency Contact Name must be minimum 2                                                |
      | a            | the Emergency Contact Relationship field                                     | Emergency Contact Relationship must be minimum 2                                        |
      | a            | the Phone Number field under Emergency Contact Information                   | Emergency Contact Relationship must be minimum 2                                        |
      |              | the Emergency Contact Relationship field after filling the Emergency Contact | Emergency Contact Relationship is required because you added an emergency contact name. |
      |              | the Phone Number field after filling the Emergency Contact                   | Phone number is required because you added an emergency contact name.                   |

  Scenario : If the input entered in the field is valid, then user can proceed to the "Plan Type Step 3" Section

    And   User is under the "Insurance & Contact Info Step 2" section
    And   User fills all mandatory fields with valid data
    When  User clicks the "Next" button
    Then  User proceeds to the "Pan Type Step 3" section

#Check down below :

  Scenario Outline: User can change the selected plan under the "Plan Type Step 3" section
    And  User is on the "<Section>" Section
    When User chooses <Plan>
    Then <Options> should display

    Examples:
      | Section                  | Plan            | Options                       |
      | Plan Type                | Single Coverage | Nothing                       |
      | Plan Type                | Dual Coverage   | Second Participant Option     |
      | Plan Type                | Family Coverage | Spouse  Section               |
      | Plan Type                | Family Coverage | Child X Section               |
      | Expatriate Services Plan | None            | Nothing                       |
      | Expatriate Services Plan | Family Coverage | the ravel information Section |
      | Pet Services Plan        | None            | Nothing                       |
      | Pet Services Plan        | X pets          | X Pets Sections               |


  Scenario Outline: Invalid input leads to error message and user can't proceed to the "Payment Info Step 4" Section
# ADd plan in one scenario - duplicates
    And   User is under the "Plan Type Step 3" section
    And   User selects the <Plan> Plan
    And   User enters "<InvalidInput>" in "<Field>"
    When  User clicks the "Next" Button
    Then  User gets the error message "<ErrorMessage>"

    Examples:
      | Plan            | InvalidInput | Field                       | ErrorMessage                                              |
      | Dual Coverage   |              | all the mandatory fields    | Please ensure all fields are filled in before proceeding. |
      | Dual Coverage   |              | the First Name field        | First Name is required                                    |
      | Dual Coverage   | a            | the First Name field        | First Name must be minimum 2                              |
      | Dual Coverage   | a            | the Last Name field         | Last Name must be minimum 2                               |
      | Dual Coverage   | a            | the Last Name field         | Last Name must be minimum 2                               |
      | Dual Coverage   |              | the Birth Date field        | Birth date is required                                    |
      | Family Coverage |              | all the mandatory fields    | Please ensure all fields are filled in before proceeding. |
      | Family Coverage |              | the Spouse First Name field | First Name is required                                    |
      | Family Coverage | a            | the Spouse First Name field | First Name must be minimum 2                              |
      | Family Coverage |              | the Spouse Last Name field  | Last Name is required                                     |
      | Family Coverage | a            | the Spouse Last Name field  | Last Name must be minimum 2                               |
      | Family Coverage |              | the Spouse Birth Date field | Birth date is required                                    |
      | Family Coverage |              | Any Child First Name field  | First Name is required                                    |
      | Family Coverage | a            | Any Child First Name field  | First Name must be minimum 2                              |
      | Family Coverage |              | Any Child Last Name field   | Last Name is required                                     |
      | Family Coverage | a            | Any Child Last Name field   | Last Name must be minimum 2                               |
      | Family Coverage |              | Any Child Birth Date field  | Child Birth date is required                              |
      | X Pet           |              | Any Pet Type field          | Pet Type is required                                      |

  Scenario : If the input entered in the field is valid then user can proceed to the "Pan Type Step 4" Section

    And   User is under the "Pan Type Step 3" section
    And   User fills all mandatory fields with valid data
    When  User clicks the "Next" button
    Then  User proceeds to the "Pan Type Step 4" section

  Scenario Outline: Invalid input leads to error message and the "Enroll Now" Button is disabled

    And   User is under the "Payment Info Step 4" section
    When  User enters "<InvalidInput>" in "<Field>"
    Then  User gets the error message "<ErrorMessage>"
    And   The "Enroll Now" button is disabled

    Examples:
      | InvalidInput | Field                    | ErrorMessage                                              |
      |              | all the mandatory Fields | Please ensure all fields are filled in before proceeding. |
      | a            | the Address Field        | Address must be minimum 2                                 |
      |              | the Car Number Field     | Card Number is required                                   |
      |              | the Security Code        | Security Code is required                                 |
      |              | the Name on Card         | Name on Card is required                                  |
      |              | the Expiration Date      | Expiration Date is required                               |
      |              | the Coupon Code          | Invalid Coupon Code                                       |

  Scenario : If the input entered in the field is valid, user can Enroll

    And   User is under the "Payment Info Step 4" section
    And   User fills all mandatory fields with valid data
    And   User checks the confirmation checkbox
    When  User clicks the "Enroll" button
    Then  User gets registered to the Plan

  Scenario Outline:Complimentary buttons should function properly under the selected section

    And   User is under <Section>
    When  User clicks <Button>
    Then  User <Outcome>

    Examples:
      | Section                 | Button                                                       | Outcome                                        |
      | Any Section             | the Calendar button                                          | gets the calendar modal                        |
      | the Plan Type Step 3    | the Add Child Button under the Family Coverage               | Add a new Child Section                        | zidodun la7al
      | the Plan Type Step 3    | the X Button After adding a new Child in the Family Coverage | removes the selected Child section             | zidoun lahal
      | the Payment Info Step 4 | Any Edit Button                                              | is redirected to the specific section          |
      | the Payment Info Step 4 | the terms and conditions button                              | is redirected to the terms and conditions page |
      | the Payment Info Step 4 | the privacy policy button                                    | is redirected to the privacy policy page       |

  Scenario: Successful application of valid coupon code

    And  User is udner the "Payment Info Step 4" Section
    And  User enters a valid coupon code in the coupon field
    When User clicks the "Apply" button
    Then User should see a message "Coupon applied successfully"
    And  The discount should be reflected in the order total


  Scenario: Confirming the total amount after selecting the desired plan
    Given User picked a plan
    And   User filled all the information corretly
    When  User gets to the Step 4
    Then  User sees the exact total amount for the selected plan

  Scenario Outline:Navigating through the different sections

    And   User is under <Section>
    And   Mandatory fields are filled with valid data
    When  User clicks <Button>
    Then  User <Outcome>

    Examples:
      | Section                             | Button                  | Outcome                                              |
      | any section                         | the Next Button         | is redirected to the next section                    |
      | any section                         | the next section's icon | is redirected to the next section                    |
      | the Payment Info Step 4             | the Previous button     | is redirected to the Plan Type Step 3 section        |
      | the Payment Info Step 4             | the Step 3 icon button  | is redirected to the Plan Type Step 3 section        |
      | the Plan Type Step 3                | the Previous button     | is redirected to the Insurance & Contact Info Step 2 |
      | the Plan Type Step 3                | the Step 2 icon button  | is redirected to the Insurance & Contact Info Step 2 |
      | the Plan Type Step 3                | the Step 1 icon button  | is redirected to the Person Info Step 1 section      |
      | the Insurance & Contact Info Step 2 | the Previous button     | is redirected to the Person Info Step 1 section      |
      | the Insurance & Contact Info Step 2 | the Step 1 icon button  | is redirected to the Person Info Step 1 section      |




# | a             | Emergency contact       | Emergency contact must be minimum 2                 |
# |               | MI (Optional)           | MI must be minimum 2                                |
# |               | Travel Location         | Travel Location is required                         |
# |               | Travel Date From        | Travel Date From is required                        |
# |               | Travel Date             | Travel Date To is required                          |
# |               | Breed                   | Breed is required                                   |
# |  a            | Breed                   | Breed must be minimum 2                             |
# |               | Pet Gender              | Pet Gender is required                              |
# |               | Pet Age                 | Pet Age is required                                 |
# |               | Pet Name                | Pet Name is required                                |
# |  a            | Pet Name                | Breed must be minimum 2                             |


# Question: The Expatriate Service is optional but After you select the Family Coverage , if the user doesn't fill the Travel location + Travel dates ... shouldn't he get error messages
# Question:  Same thing for the Pet Service, when you only get an error message for the type (Pet Type is Required) + the 2 fields (Breed & Pet Name) Shouldn't we get also minimum is required 2 when you only type 2 letters.

#Bug : If you enter only spaces in any of the input fields, such as typing 4 spaces in the name field, the system accepts it without displaying an error message.
# As soon as I enter the emergency contact Name , these 2 error messages show up immediately without pressing the Next Button : Emergency Contact Relationship is required because you added an emergency contact name. & Phone number is required because you added an emergency contact name.
# The country code should not be deleted