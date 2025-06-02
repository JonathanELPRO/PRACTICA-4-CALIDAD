Then('I should see the following order summary table:') do |expected_table|
  expected_rows = expected_table.hashes
  place_an_order_table = PlaceAnOrderTable.new(page)

  expected_rows.each_with_index do |expected_row, index|
    actual_total_price = place_an_order_table.total_price_at(index+1)

    expect(actual_total_price).to eq(expected_row["Total Price"])
  end
end

