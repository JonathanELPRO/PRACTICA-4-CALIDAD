Then(/^I should see the following table:$/) do |expected_table|
  expected_rows = expected_table.hashes
  catalog_table = CatalogTable.new(page)

  expected_rows.each_with_index do |expected_row, index|
    expect(catalog_table.purchase_info_at(index + 1, "Item Number")).to eq(expected_row['Item Number'])
    expect(catalog_table.purchase_info_at(index + 1, "Item Name")).to eq(expected_row['Item Name'])
    expect(catalog_table.purchase_info_at(index + 1, "Unit Price")).to eq(expected_row['Unit Price'])
  end
end





