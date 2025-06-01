Feature: Show the order information
  As a returning GMO user,
  I want the table that present a summary of my purchase,
  so that I can view the finally cost before finalizing my order.

  Background:
    Given I am on the GMO main page
    When I click on the "Enter GMO OnLine" button


  Scenario: Display all the total prices based on our purchase
      When I fill in the order quantities as listed below:
      | Item Name                | Order Quantity |
      | 3 Person Dome Tent       | 2              |
      | External Frame Backpack  | 0              |
      | Glacier Sun Glasses      | 1              |
      | Padded Socks             | 0              |
      | Hiking Boots             | 0              |
      | Back Country Shorts      | 3              |
      And I click on the "Place An Order" button
      Then I should see the following order summary table:
        |         Description      | Total Price |
        | 3 Person Dome Tent       | $ 599.98    |
        | Glacier Sun Glasses      | $ 67.99     |
        | Back Country Shorts      | $ 74.85     |
        | Product Total            | $ 742.82    |
        | Sales Tax                | $ 37.14     |
        | Shipping & Handling      | $ 5.00      |
        | Grand Total              | $ 784.96    |

  Scenario: Validate total prices are correct based on quantity and unit price
  When I fill in the order quantities as listed below:
    | Item Name                | Order Quantity |
    | 3 Person Dome Tent       | 2              |
    | External Frame Backpack  | 0              |
    | Glacier Sun Glasses      | 1              |
    | Padded Socks             | 0              |
    | Hiking Boots             | 0              |
    | Back Country Shorts      | 3              |
  And I click on the "Place An Order" button
  Then the total price of each product in the "Place Order" table should be correct
   