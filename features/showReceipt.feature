Feature: Display receipt information  
  As a customer who has completed an online purchase,  
  I want to view a receipt with the correct product details and prices,  
  so that I can verify my order was processed accurately and completely.

Background:
  Given I am on the GMO main page
    And I click on the "Enter GMO OnLine" button
    And I fill in the order quantities as listed below:
      | Item Name                | Order Quantity |
      | 3 Person Dome Tent       | 2              |
      | External Frame Backpack  | 0              |
      | Glacier Sun Glasses      | 1              |
      | Padded Socks             | 0              |
      | Hiking Boots             | 0              |
      | Back Country Shorts      | 3              |
    And I click on the "Place An Order" button
    And I click on the "Proceed With Order" button
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
    And I enable the "shipSameAsBill" checkbox  
    And I click on the "Place The Order" button
  

@onlyThis
Scenario: Verify order receipt details
  When I have reached the "OnLine Store Receipt" page
  Then I should see the following receipt details:
    | Qty | Product Description      | Unit Price | Total Price |
    | 2   | 3 Person Dome Tent       | $ 299.99    | $ 599.98     |
    | 1   | Glacier Sun Glasses      | $ 67.99     | $ 67.99      |
    | 3   | Back Country Shorts      | $ 24.95     | $ 74.85      |

 Scenario: Each product total matches quantity times unit price
    When I have reached the "OnLine Store Receipt" page
    Then the total price of each product in the "Receipt" table should be correct
