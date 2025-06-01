Feature: Fill in shipping information
  As a customer shopping online,  
  I want to provide my shipping information details,  
  so that I can finalize my transaction successfully.

Background:
  Given I am on the GMO main page
    And I click on the "Enter GMO OnLine" button
    And I fill in the order quantities as listed below:
      | Item Name               | Order Quantity |
      | 3 Person Dome Tent      | 10             |
      | External Frame Backpack | 5              |
    And I click on the "Place An Order" button
    And I click on the "Proceed With Order" button

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
