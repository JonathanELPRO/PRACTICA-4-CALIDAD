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

And(/^the Product Total and the Grand Total in the "(Place Order|Receipt)" table should be correct$/) do |table_type|
  table = case table_type
          when "Place Order" then PlaceAnOrderTable.new(page)
          when "Receipt" then ReceiptTable.new(page)
          else raise "Unknown table type: #{table_type}"
          end

  row_count = 3 
  expected_total_price_from_product_total = 0
  (1..row_count).each do |index|
    qty = table.purchase_info_at(index, 'Qty').to_i
    unit_price = table.purchase_info_at(index, 'Unit Price').gsub(/[^\d.]/, '').to_f
    total_price = table.total_price_at(index).gsub(/[^\d.]/, '').to_f

    expected_total = (qty * unit_price).round(2)
    expected_total_price_from_product_total = expected_total_price_from_product_total + expected_total
  end

  total_price_from_product_total = table.total_price_at(4).gsub(/[^\d.]/, '').to_f
  total_price_from_salex_tax = table.total_price_at(5).gsub(/[^\d.]/, '').to_f
  total_price_from_shipping_handling = table.total_price_at(6).gsub(/[^\d.]/, '').to_f
  total_price_grand_total = table.total_price_at(7).gsub(/[^\d.]/, '').to_f

  expect(total_price_from_product_total).to eq(expected_total_price_from_product_total)
  expect(total_price_grand_total).to eq(expected_total_price_from_product_total + total_price_from_salex_tax + total_price_from_shipping_handling)
end
  