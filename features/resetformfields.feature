Feature: Clear Order Form
  As an online shopper,
  I want to to clear all items from my order form,
  so that I can start placing a fresh order.

  Background:
    Given I am on the GMO main page
    When I click on the "Enter GMO OnLine" button

   Scenario: Clear form after adding multiple items
    When I fill in the order quantities as listed below:
      | Item Name                | Order Quantity |
      | 3 Person Dome Tent       | 2              |
      | External Frame Backpack  | 0              |
      | Glacier Sun Glasses      | 1              |
      | Padded Socks             | 0              |
      | Hiking Boots             | 0              |
      | Back Country Shorts      | 3              |
    And I click on the "Reset Form" button
    Then all fields should be cleared