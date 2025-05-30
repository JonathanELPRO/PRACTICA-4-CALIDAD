Feature: View Planned Site Features
  As an online shopper, 
  I want to see what new features are planned for this site,
  so that I  know what improvements to expect.

  Scenario: Show future technologies that may be added
      Given I am on the GMO main page
      When I click on the "About The GMO Site" button
      Then I see the list of future technologies for the site
        | Style sheets          |
        | Multimedia            |
        | VBscript              |
        | Plug-Ins              |
        | IIOP                  |
        | Cookies               |
        | Secure transactions   |
        | Database access       |