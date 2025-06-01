When('I enable the {string} checkbox') do |checkbox_name|    
  check(checkbox_name)
end

Then('I have reached the {string} page') do |page_name|
  expect(page).to have_title(/#{page_name}/i)
end

Then('I should see the following message {string}') do |expected_message|
  alert = page.driver.browser.switch_to.alert
  actual_message = alert.text
  expect(actual_message).to eq(expected_message)
end

Given('I am on the GMO main page') do  
  visit 'http://demo.borland.com/gmopost/'
  expect(page).to have_content("Welcome to Green Mountain Outpost's OnLine Catalog!")
end

When('I click on the {string} button') do |button_text|
  click_button(button_text)
end

Then(/^the total price of each product in the "(Place Order|Receipt)" table should be correct$/) do |table_type|
  table = case table_type
          when "Place Order" then PlaceAnOrderTable.new(page)
          when "Receipt" then ReceiptTable.new(page)
          else raise "Unknown table type: #{table_type}"
          end

  row_count = 3 
  (1..row_count).each do |index|
    qty = table.purchase_info_at(index, 'Qty').to_i
    unit_price = table.purchase_info_at(index, 'Unit Price').gsub(/[^\d.]/, '').to_f
    total_price = table.total_price_at(index).gsub(/[^\d.]/, '').to_f

    expected_total = (qty * unit_price).round(2)
    expect(total_price).to eq(expected_total)
  end
end