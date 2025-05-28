Then('I should see the following order summary table:') do |expected_table|
  expected_rows = expected_table.hashes
  place_an_order_table = PlaceAnOrderTable.new(page)

  expected_rows.each_with_index do |expected_row, index|
    actual_total_price = place_an_order_table.total_price_at(index+1)

    expect(actual_total_price).to eq(expected_row["Total Price"])
  end
end

Then(/^each product's total price should be the result of quantity times unit price$/) do
  place_an_order_table = PlaceAnOrderTable.new(page)

  (1..3).each do |index|
    qty = place_an_order_table.purchase_info_at(index, 'Qty').to_i
    unit_price = place_an_order_table.purchase_info_at(index, 'Unit Price').gsub(/[^\d.]/, '').to_f
    total_price = place_an_order_table.total_price_at(index).gsub(/[^\d.]/, '').to_f

    expected_total = (qty * unit_price).round(2)
    #puts "Expected Total: #{expected_total}"

    expect(total_price).to eq(expected_total)
  end
end