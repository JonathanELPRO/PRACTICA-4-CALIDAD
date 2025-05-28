Feature: Fill out the item quantity form
  As an online shopper,
  I want to add product quantities to my item quantity form,
  so that I can make a purchase.
  
  Background:
    Given I am on the GMO main page
    When I click on the "Enter GMO OnLine" button

  Scenario: Add quantities to the items
    When I enter the order quantities:
      | Item Name                | Order Quantity |
      | 3 Person Dome Tent       | 2              |
      | External Frame Backpack  | 0              |
      | Glacier Sun Glasses      | 1              |
      | Padded Socks             | 0              |
      | Hiking Boots             | 0              |
      | Back Country Shorts      | 3              |
    And I click on the "Place An Order" button
    Then I should see the following quantities:
      | Product Description      | Qty |
      | 3 Person Dome Tent       | 2   |
      | Glacier Sun Glasses      | 1   |
      | Back Country Shorts      | 3   |
