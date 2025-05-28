When(/^I (fill in|set zero) the order quantities as listed below:$/) do |action, table|
  quantities = table.hashes
  catalog_table = CatalogTable.new(page)

  case action
  when 'fill in'
    quantities.each do |item|
      catalog_table.fill_quantity(item['Item Name'], item['Order Quantity'])
    end
  when 'set zero'
    quantities.each do |item|
      catalog_table.fill_quantity(item['Item Name'], '0')
    end
  else
    raise "Unknown action: #{action}"
  end
end

Then(/^I should see the following quantities:$/) do |table|
  expected_rows = table.hashes
  place_an_order_table = PlaceAnOrderTable.new(page)

  expected_rows.each_with_index do |expected_row, index|
    actual_qty, actual_description = place_an_order_table.row_at(index+1)
    expect(actual_description).to eq(expected_row['Product Description'])
    expect(actual_qty).to eq(expected_row['Qty'])
  end
end

Then('I should see the following message {string}') do |expected_message|
  alert = page.driver.browser.switch_to.alert
  actual_message = alert.text
  expect(actual_message).to eq(expected_message)
end



