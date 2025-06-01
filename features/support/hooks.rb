After do 
    Capybara.current_session.driver.quit
end

Before '@maximize' do
  page.driver.browser.manage.window.maximize
end


Before('@fillOrder') do
  step 'I am on the GMO main page'
  step 'I click on the "Enter GMO OnLine" button'
  step 'I fill in the order quantities as listed below:', table(%(
    | Item Name               | Order Quantity |
    | 3 Person Dome Tent      | 10             |
    | External Frame Backpack | 5              |
  ))
  step 'I click on the "Place An Order" button'
  step 'I click on the "Proceed With Order" button'
end

Before('@fillOrderAndBillingShippingForm') do
  step 'I am on the GMO main page'
  step 'I click on the "Enter GMO OnLine" button'
  step 'I fill in the order quantities as listed below:', 
    table(%(
      | Item Name               | Order Quantity |
      | 3 Person Dome Tent      | 2              |
      | External Frame Backpack | 0              |
      | Glacier Sun Glasses     | 1              |
      | Padded Socks            | 0              |
      | Hiking Boots            | 0              |
      | Back Country Shorts     | 3              |
    ))
  step 'I click on the "Place An Order" button'
  step 'I click on the "Proceed With Order" button'
  step 'I provide the "billing" details as follows:', 
    table(%(
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
    ))
  step 'I enable the "shipSameAsBill" checkbox'
  step 'I click on the "Place The Order" button'
end




