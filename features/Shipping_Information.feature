@fillOrder
Feature: Fill in shipping information
  As a customer shopping online,  
  I want to provide my shipping information details,  
  so that I can finalize my transaction successfully.

Scenario: Manually enter shipping details
  Given I have reached the "Billing Information" page
    And I provide the "billing" details as follows:
      | Name        | Valeria Montes      |
      | Address     | Av. del Sol 789     |
      | City        | Oruro               |
      | State       | Oruro               |
      | Zip         | 70321               |
      | Phone       | 765-987-1234        |
      | E-mail      | valeria@gmail.com   |
      | Credit Card | American Express    |
      | Card Number | 1234-123456-12345   |
      | Expiration  | 09/27               |
  When I provide the "shipping" details as follows:
      | Name    | Lucia Díaz       |
      | Address | Calle Aroma 123  |
      | City    | Santa Cruz       |
      | State   | Santa Cruz       |
      | Zip     | 98766            |
      | Number  | 765-987-4321     |
  And I click on the "Place The Order" button
  Then I have reached the "OnLine Store Receipt" page

  @onlyThis
  Scenario: Automatically fill in the shipping fields
  Given I have reached the "Billing Information" page
    And I provide the "billing" details as follows:
      | Name        | Valeria Montes      |
      | Address     | Av. del Sol 789     |
      | City        | Oruro               |
      | State       | Oruro               |
      | Zip         | 70321               |
      | Phone       | 765-987-1234        |
      | E-mail      | valeria@gmail.com   |
      | Credit Card | American Express    |
      | Card Number | 1234-123456-12345   |
      | Expiration  | 09/27               |
  When I enable the "shipSameAsBill" checkbox  
  And I click on the "Place The Order" button
  Then I have reached the "OnLine Store Receipt" page
