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

Then(/^I should see the following quantities and prices:$/) do |table|
  expected_rows = table.hashes
  place_an_order_table = PlaceAnOrderTable.new(page)

  expected_rows.each_with_index do |expected_row, index|
    actual_qty = place_an_order_table.purchase_info_at(index+1, 'Qty')
    actual_description = place_an_order_table.purchase_info_at(index+1,'Product Description')
    actual_unit_price = place_an_order_table.purchase_info_at(index+1, 'Unit Price')
    expect(actual_description).to eq(expected_row['Product Description'])
    expect(actual_qty).to eq(expected_row['Qty'])
    expect(actual_unit_price).to eq(expected_row['Unit Price'])

  end
end





