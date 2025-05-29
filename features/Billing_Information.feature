Feature: Fill in billing information
  As an online shopper,
  I want to Fill in my billing information,
  so that I could complete my purchase.

  Background:
    Given I am on the GMO Home Page
    And I click on the "Enter GMO OnLine" button
    And I enter the order quantities as show below:
        | Item Name                | Order Quantity |
        | 3 Person Dome Tent       | 10             |
        | External Frame Backpack  | 5              |
    And I click on the "Place An Order" button
    And I click on the "Proceed With Order" button
  

  Scenario Outline: Fill in my billing information with different card types
    Given I am at "Billing Information" Page
    When I enter the bill to information as shown below:
      | Name        | <Name>           |
      | Address     | <Address>        |
      | City        | <City>           |
      | State       | <State>          |
      | Zip         | <Zip>            |
      | Phone       | <Phone>          |
      | E-mail      | <E-mail>         |
      | Credit Card | <Credit Card>    |
      | Card Number | <Card Number>    |
      | Expiration  | <Expiration>     |
    And I check the "shipSameAsBill" checkbox
    And I click on the "Place The Order" button
    Then I am at "OnLine Store Receipt" Page
    Examples:
    | Name   | Address    | City | State| Zip   | Phone        | E-mail           | Credit Card      | Card Number        | Expiration  |
    | Pepito | Cala cala  | Cbba | Cbba | 33126 | 123-123-1234 | pepito@gmail.com | American Express | 1234-123456-12345  | 12/24       |
    | Maria  | 3er anillo | Scz  | Scz  | 65432 | 456-789-0123 | maria@gmail.com  | Visa             | 1234-1234-1234-1234| 01/25       |
    | Ana    | Zona Sur   | Cbba | Cbba | 98765 | 321-654-9870 | ana@gmail.com    | MasterCard       | 1234-1234-1234-1234| 12/25       |
