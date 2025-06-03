@fillOrderAndBillingShippingForm
Feature: Display receipt information  
  As a customer who has completed an online purchase,  
  I want to view a receipt with the correct product details and prices,  
  so that I can verify my order was processed accurately and completely.
  
  Scenario: Each product total matches quantity times unit price
    When I have reached the "OnLine Store Receipt" page
    Then the total price of each product in the "Receipt" table should be correct
    And the Product Total and the Grand Total in the "Receipt" table should be correct
