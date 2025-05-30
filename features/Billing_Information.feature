Feature: Fill in billing information
  As an online shopper,
  I want to Fill in my billing information,
  so that I could complete my purchase.

  Background:
    Given I am on the GMO main page
    And I click on the "Enter GMO OnLine" button
    And I fill in the order quantities as listed below:
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
    | Pepito | Cala cala  | Cbba | Cbba | 33126 | 123-123-1234 | pepito@gmail.com | American Express | 1234-123456-12345  |  1226       |
    | Maria  | 3er anillo | Scz  | Scz  | 65432 | 456-789-0123 | maria@gmail.com  | Visa             | 1234-1234-1234-1234|  0126       |
    | Ana    | Zona Sur   | Cbba | Cbba | 98765 | 321-654-9870 | ana@gmail.com    | MasterCard       | 1234-1234-1234-1234|  1226       |


Scenario Outline: Fill in my billing information with missing fields
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
    Then I should see the following message "This is a required field."
    Examples:
    | Name   | Address    | City | State| Zip   | Phone        | E-mail           | Credit Card      | Card Number        | Expiration  |
    |        | Cala cala  | Cbba | Cbba | 33126 | 123-123-1234 | pepito@gmail.com | American Express | 1234-123456-12345  | 12/26       |
    | Pepito |            | Cbba | Cbba | 33126 | 123-123-1234 | pepito@gmail.com | American Express | 1234-123456-12345  | 12/26       |
    | Pepito | Cala cala  |      | Cbba | 33126 | 123-123-1234 | pepito@gmail.com | American Express | 1234-123456-12345  | 12/26       |
    | Pepito | Cala cala  | Cbba |      | 33126 | 123-123-1234 | pepito@gmail.com | American Express | 1234-123456-12345  | 12/26       |
    


Scenario:  Fill in my billing information with a wrong zip code
    Given I am at "Billing Information" Page
    When I enter the bill to information as shown below:
    | Name        | Pepito Perez     |
    | Address     | Cala cala        |
    | City        | Cochabamba       |
    | State       | Cochabamba       |
    | Zip         | 0                |
    | Phone       | 123-123-1234     |
    | E-mail      | pepito@gmail.com |
    | Credit Card | American Express |
    | Card Number | 1234-123456-12345|
    | Expiration  | 12/26            |
    And I check the "shipSameAsBill" checkbox
    And I click on the "Place The Order" button
    Then I should see the following message "Please enter a valid zip code in this field."


    Scenario:  Fill in my billing information with a wrong phone number
    Given I am at "Billing Information" Page
    When I enter the bill to information as shown below:
    | Name        | Pepito Perez     |
    | Address     | Cala cala        |
    | City        | Cochabamba       |
    | State       | Cochabamba       |
    | Zip         | 33126            |
    | Phone       | 123              |
    | E-mail      | pepito@gmail.com |
    | Credit Card | American Express |
    | Card Number | 1234-123456-12345|
    | Expiration  | 12/26            |
    And I check the "shipSameAsBill" checkbox
    And I click on the "Place The Order" button
    Then I should see the following message "Please enter a valid phone number in this field."


  Scenario:  Fill in my billing information with a wrong card number for Master Card
    Given I am at "Billing Information" Page
    When I enter the bill to information as shown below:
    | Name        | Pepito Perez     |
    | Address     | Cala cala        |
    | City        | Cochabamba       |
    | State       | Cochabamba       |
    | Zip         | 33126            |
    | Phone       | 123-123-1234     |
    | E-mail      | pepito@gmail.com |
    | Credit Card | MasterCard       |
    | Card Number | 1234             |
    | Expiration  | 12/26            |
    And I check the "shipSameAsBill" checkbox
    And I click on the "Place The Order" button
    Then I should see the following message "Please enter a valid card number of the form '1234-1234-1234-1234' in this field."


  Scenario:  Fill in my billing information with a wrong Expiration Date Card
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
    | Expiration  | 12/2024          |
    And I check the "shipSameAsBill" checkbox
    And I click on the "Place The Order" button
    Then I should see the following message "Please enter a valid date of the form 'MM/YY' in this field."
