@fillOrderAndBillingShippingForm
Feature: Display receipt information  
  As a customer who has completed an online purchase,  
  I want to view a receipt with the correct product details and prices,  
  so that I can verify my order was processed accurately and completely.
  
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
    And the Product Total and the Grand Total in the "Receipt" table should be correct
