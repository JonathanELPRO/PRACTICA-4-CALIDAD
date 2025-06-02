@fillOrder
Feature: Submit billing details  
  As a customer shopping online,  
  I want to provide my billing details,  
  So that I can successfully complete the checkout process.

  Scenario Outline: Submit billing details using various card types  
    Given I have reached the "Billing Information" page 
    When I provide the "billing" details as follows:  
      | Name        | Camila Vargas       |
      | Address     | Av. Circunvalación 456 |
      | City        | Sucre               |
      | State       | Chuquisaca          |
      | Zip         | 70321               |
      | Phone       | 754-321-6789        |
      | E-mail      | camila@gmail.com    |
      | Credit Card | <Credit Card>       |
      | Card Number | <Card Number>       |
      | Expiration  | 11/25               |
    And I enable the "shipSameAsBill" checkbox  
    And I click on the "Place The Order" button
    Then I have reached the "OnLine Store Receipt" page  
    Examples:  
      | Credit Card       | Card Number          | 
      | American Express  | 1234-123456-12345    |   
      | Visa              | 1234-1234-1234-1234  |  
      | MasterCard        | 1234-1234-1234-1234  | 

  Scenario Outline: Provide an invalid postal code  
    Given I have reached the "Billing Information" page  
    When I provide the "billing" details as follows:  
      | Name        | Valeria Montes      |
      | Address     | Av. del Sol 789     |
      | City        | Oruro               |
      | State       | Oruro               |
      | Zip         | <Zip>               |
      | Phone       | 765-987-1234        |
      | E-mail      | valeria@gmail.com    |
      | Credit Card | American Express    |
      | Card Number | 1234-123456-12345   |
      | Expiration  | 09/27               |
    And I enable the "shipSameAsBill" checkbox  
    And I click on the "Place The Order" button
    Then I should see the following message "Please enter a valid zip code in this field."

    Examples:
      | Zip   |
      | 000   |
      | -123  |
      | abcde |

  Scenario Outline: Enter an invalid phone number  
    Given I have reached the "Billing Information" page  
    When I provide the "billing" details as follows:  
      | Name        | Fernando Ríos       |
      | Address     | Calle Junín 456     |
      | City        | Trinidad            |
      | State       | Beni                |
      | Zip         | 98765               |
      | Phone       | <Phone>             |
      | E-mail      | fernando@mail.com   |
      | Credit Card | American Express    |
      | Card Number | 1234-123456-12345   |
      | Expiration  | 04/26               |
    And I enable the "shipSameAsBill" checkbox  
    And I click on the "Place The Order" button
    Then I should see the following message "Please enter a valid phone number in this field."

    Examples:
      | Phone           |
      | 12              |
      | abc             |
      | 999999999999999  |

  Scenario Outline: Submit form with an invalid credit card number  
    Given I have reached the "Billing Information" page  
    When I provide the "billing" details as follows:  
      | Name        | Laura Méndez             |
      | Address     | Av. Aroma 234            |
      | City        | Tarija                   |
      | State       | Tarija                   |
      | Zip         | 45678                    |
      | Phone       | 765-987-4321             |
      | E-mail      | laura.mendez@gmail.com   |
      | Credit Card | <Credit Card>            |
      | Card Number | <Card Number>            |
      | Expiration  | 10/26                    |
    And I enable the "shipSameAsBill" checkbox  
    And I click on the "Place The Order" button
    Then I should see the following message "<Error Message>"

    Examples:
      | Credit Card      | Card Number        | Error Message                                                                 |
      | American Express | 1234               | Please enter a valid card number of the form '1234-123456-12345' in this field. |
      | MasterCard       | 1234-123           | Please enter a valid card number of the form '1234-1234-1234-1234' in this field. |
      | Visa             | 4321-0000-0000     | Please enter a valid card number of the form '1234-1234-1234-1234' in this field. |

  Scenario Outline: Submit form with incorrectly formatted expiry date  
    Given I have reached the "Billing Information" page  
    When I provide the "billing" details as follows:  
      | Name        | Fernando Ríos       |
      | Address     | Calle Junín 456     |
      | City        | Trinidad           |
      | State       | Beni                |
      | Zip         | 98765               |
      | Phone       | 765-987-4321        |
      | E-mail      | fernando@mail.com   |
      | Credit Card | American Express    |
      | Card Number | 1234-123456-12345   |
      | Expiration  | <Expiration>        |
    And I enable the "shipSameAsBill" checkbox  
    And I click on the "Place The Order" button
    Then I should see the following message "Please enter a valid date of the form 'MM/YY' in this field."

    Examples:
      | Expiration |
      | 04/2026    |
      | abc       |

  Scenario Outline: Submit billing form with missing required fields  
    Given I have reached the "Billing Information" page  
    When I provide the "billing" details as follows:  
      | Name        | <Name>            |
      | Address     | <Address>         |
      | City        | <City>            |
      | State       | <State>           |
      | Zip         | <Zip>             |
      | Phone       | <Phone>           |
      | E-mail      | <E-mail>          |
      | Credit Card | <Credit Card>     |
      | Card Number | <Card Number>     |
      | Expiration  | <Expiration>      | 
    And I enable the "shipSameAsBill" checkbox  
    And I click on the "Place The Order" button
    Then I should see the following message "This is a required field."

    Examples:
      | Name         | Address       | City       | State     | Zip   | Phone        | E-mail             | Credit Card    | Card Number           | Expiration |
      |              | Av. Bolívar   | Sucre      | Chuquisaca| 12345 | 765-432-1000 | maria@example.com   | MasterCard     | 1234-5678-9101-1121   | 12/25      |
      | Juan Vargas  |               | Potosí     | Potosí    | 54321 | 700-321-9876 | juan@example.com    | Visa           | 1111-2222-3333-4444   | 11/26      |
      | Elisa Gómez  | Calle A #123  |            | La Paz    | 33445 | 789-654-3210 | elisa@example.com   | American Express| 1234-567890-12345     | 10/27      |
      | Rodrigo Ríos | Calle C #456  | Oruro      |           | 66778 | 723-543-7788 | rodrigo@example.com | MasterCard     | 5555-6666-7777-8888   | 09/26      |
