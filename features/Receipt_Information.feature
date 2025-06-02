@fillOrder
Feature: Show Receipt Information
  As an online shopper,
  I want to review my billing information,
  so that I can verify that everything is correct before completing my purchase.

Scenario Outline: Show billing information on the receipt
    Given I have reached the "Billing Information" page 
    When I provide the "billing" details as follows:
      | Name        | <Name>           |
      | Address     | <Address>        |
      | City        | <City>           |
      | State       | <State>          |
      | Zip         | <Zip>            |
      | Phone       | <Phone>          |
      | E-mail      | <E-mail>         |
      | Credit Card | American Express |
      | Card Number | <Card Number>    |
      | Expiration  | <Expiration>     |
    And I enable the "shipSameAsBill" checkbox  
    And I click on the "Place The Order" button
    Then I should see the following billing information on the receipt:
      | Name   | <Name>            |
      | Phone  | <Phone>           |
      | Address| <Address>         |
      | City   | <City>            |
      | State  | <State>           |
      | Zip    | <Zip>             |
    And I click for return on the "Return to Home Page" button
    Examples:
      | Name   | Address    | City | State | Zip   | Phone        | E-mail           | Card Number        | Expiration  |
      | Pepito | Cala cala  | Cbba | Cbba  | 33126 | 123-123-1234 | pepito@gmail.com | 1234-123456-12345  | 12/26       |
      | Maria  | 3er anillo | Scz  | Scz   | 33127 | 124-121-1234 | maria@gmail.com  | 1234-123456-12245  | 11/26       |

Scenario Outline: Show shipping information on the receipt
    Given I have reached the "Billing Information" page 
    When I provide the "billing" details as follows:
      | Name        | <Name>           |
      | Address     | <Address>        |
      | City        | <City>           |
      | State       | <State>          |
      | Zip         | <Zip>            |
      | Phone       | <Phone>          |
      | E-mail      | <E-mail>         |
      | Credit Card | American Express |
      | Card Number | <Card Number>    |
      | Expiration  | <Expiration>     |
    And I enable the "shipSameAsBill" checkbox  
    And I click on the "Place The Order" button
    Then I should see the following shipping information on the receipt:
      | Name   | <Name>            |
      | Phone  | <Phone>           |
      | Address| <Address>         |
      | City   | <City>            |
      | State  | <State>           |
      | Zip    | <Zip>             |
    And I click for return on the "Return to Home Page" button
    Examples:
      | Name   | Address    | City | State | Zip   | Phone        | E-mail           | Card Number        | Expiration  |
      | Pepito | Cala cala  | Cbba | Cbba  | 33126 | 123-123-1234 | pepito@gmail.com | 1234-123456-12345  | 12/26       |
      | Maria  | 3er anillo | Scz  | Scz   | 33127 | 124-121-1234 | maria@gmail.com  | 1234-123456-12245  | 11/26       |   
