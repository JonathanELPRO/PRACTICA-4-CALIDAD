Feature: Fill in shipping Information
  As an online shopper,
  I want to fill in my shipping information,
  so that I can complete my purchase.

Background:
    Given I am on the GMO main page
    And I click on the "Enter GMO OnLine" button
    And I fill in the order quantities as listed below:
        | Item Name                | Order Quantity |
        | 3 Person Dome Tent       | 10             |
        | External Frame Backpack  | 5              |
    And I click on the "Place An Order" button
    And I click on the "Proceed With Order" button


Scenario: Manually fill in my shipping information
    Given I am at "Billing Information" Page
    And I enter the bill to information as shown below:
      | Name        | Pepito Perez     |
      | Address     | Cala cala        |
      | City        | Cochabamba       |
      | State       | Cochabamba       |
      | Zip         | 33126            |
      | Phone       | 123-123-1234     |
      | E-mail      | pepito@gmail.com |
      | Credit Card | American Express |
      | Card Number | 1234-123456-12345|
      | Expiration  | 12/26            |
    When I enter the shipping to information as shown below:
      | Name        | Maria Perez      |
      | Address     | Cala cala        |
      | City        | Cochabamba       |
      | State       | Cochabamba       |
      | Zip         | 33127            |
      | Phone       | 123-122-1234     |
    And I click on the "Place The Order" button
    Then I am at "OnLine Store Receipt" Page


Scenario: Fill in my Shipping Information Automatically using "Bill To" information
    Given I am at "Billing Information" Page
    When I enter the bill to information as shown below:
      | Name        | Pepito Perez     |
      | Address     | Cala cala        |
      | City        | Cochabamba       |
      | State       | Cochabamba       |
      | Zip         | 33126            |
      | Phone       | 123-123-1234     |
      | E-mail      | pepito@gmail.com |
      | Credit Card | American Express |
      | Card Number | 1234-123456-12345|
      | Expiration  | 12/26            |
    And I check the "shipSameAsBill" checkbox
    Then The billing information should be copied to the shipping fields as shown below:
      | Name    | Pepito Perez |
      | Address | Cala cala    |
      | City    | Cochabamba   |
      | State   | Cochabamba   |
      | Zip     | 33126        |
      | Phone   | 123-123-1234 |