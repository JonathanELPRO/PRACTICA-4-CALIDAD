Then('I should see the following billing information on the receipt:') do |table|
  expected_info = table.rows_hash

  expect(page).to have_content(expected_info['Name'])
  expect(page).to have_content(expected_info['Address'])
  expect(page).to have_content(expected_info['City'])
  expect(page).to have_content(expected_info['State'])
  expect(page).to have_content(expected_info['Zip'])
end

Then('I should see the following shipping information on the receipt:') do |table|
  expected_info = table.rows_hash

  expect(page).to have_content(expected_info['Name'])
  expect(page).to have_content(expected_info['Phone'])
  expect(page).to have_content(expected_info['Address'])
  expect(page).to have_content(expected_info['City'])
  expect(page).to have_content(expected_info['State'])
  expect(page).to have_content(expected_info['Zip'])
end


And('I click for return on the "Return to Home Page" button') do
  click_button('Return to Home Page')
end
