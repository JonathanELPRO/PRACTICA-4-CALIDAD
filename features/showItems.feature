Feature: View all catalog items
  As a returning GMO user,
  I want to view the entire catalog with emphasis on the selected item,
  so that I can see all options and focus on my choice.

  Scenario: Show full catalog and highlight selected items
    Given I am on the GMO main page
    When I click on the "Enter GMO OnLine" button
    And I click on each product link:
      | Item Name               | Item Number |
      | 3 Person Dome Tent      | 1000        |
      | External Frame Backpack | 1001        |
      | Glacier Sun Glasses     | 1002        |
      | Padded Socks            | 1003        |
      | Hiking Boots            | 1004        |
      | Back Country Shorts     | 1005        |
    Then I can see the catalog and each product is highlighted
