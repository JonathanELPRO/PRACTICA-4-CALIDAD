Feature: View the summary table of the catalog
  As a returning GMO user,
  I want to view the entire catalog summary table,
  so that I can see all items with their numbers, names, and unit prices.

  Scenario: Catalog summary table matches expected data
    Given I am on the GMO main page
    When I click on the "Enter GMO OnLine" button
    Then I should see the following table:
      | Item Number | Item Name               | Unit Price |
      | 1000        | 3 Person Dome Tent      | $ 299.99    |
      | 1001        | External Frame Backpack | $ 179.95    |
      | 1002        | Glacier Sun Glasses     | $ 67.99     |
      | 1003        | Padded Socks            | $ 19.99     |
      | 1004        | Hiking Boots            | $ 109.90    |
      | 1005        | Back Country Shorts     | $ 24.95     |
