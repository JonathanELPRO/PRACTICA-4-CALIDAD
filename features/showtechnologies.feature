Feature: View Current Site Technology
  As an online shopper, 
  I want to see what technologies power this site,
  so that I understand how reliable and modern it is.

Scenario: Show technologies of the site
    Given I am on the GMO main page
    When I click on the "About The GMO Site" button
    Then I see the list of technologies used for the site
      | HTML 3.2                     |
      | HTML Browser Extensions      |
      | Animation                    |
      | JavaScript                   |
      | CGI                          |
      | Java                         |
      | ActiveX                      |
      | Client-side processes        |
      | Server-side processes        |