Then('I should see the following receipt details:') do |expected_table|
  expected_rows = expected_table.hashes
  receipt_table = ReceiptTable.new(page)

  expected_rows.each_with_index do |expected_row, index|
    actual_qty = receipt_table.purchase_info_at(index + 1, 'Qty')
    actual_desc = receipt_table.purchase_info_at(index + 1, 'Product Description')
    actual_unit_price = receipt_table.purchase_info_at(index + 1, 'Unit Price')
    actual_total_price = receipt_table.total_price_at(index+1)

    expect(actual_qty).to eq(expected_row['Qty'])
    expect(actual_desc).to eq(expected_row['Product Description'])
    expect(actual_unit_price).to eq(expected_row['Unit Price'])
    expect(actual_total_price).to eq(expected_row['Total Price'])
  end
end


