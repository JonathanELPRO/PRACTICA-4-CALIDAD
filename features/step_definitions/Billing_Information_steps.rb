When('I provide the billing details as follows:') do |table|
  info = table.rows_hash

  fill_in 'billName', with: info['Name']
  fill_in 'billAddress', with: info['Address']
  fill_in 'billCity', with: info['City']
  fill_in 'billState', with: info['State']
  fill_in 'billZipCode', with: info['Zip']
  fill_in 'billPhone', with: info['Phone']
  fill_in 'billEmail', with: info['E-mail']
  select info['Credit Card'], from: 'CardType'
  fill_in 'CardNumber', with: info['Card Number']
  fill_in 'CardDate', with: info['Expiration']
end

When('I enable the {string} shipping option') do |checkbox_name|
  check(checkbox_name)
end

Then('I have reached the {string} page') do |page_name|
  expect(page).to have_title(/#{page_name}/i)
end


