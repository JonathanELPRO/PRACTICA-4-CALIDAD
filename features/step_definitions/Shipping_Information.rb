When('I enter the shipping to information as shown below:') do |table|
  info = table.rows_hash

  fill_in 'shipName', with: info['Name']
  fill_in 'shipAddress', with: info['Address']
  fill_in 'shipCity', with: info['City']
  fill_in 'shipState', with: info['State']
  fill_in 'shipZipCode', with: info['Zip']
  fill_in 'shipPhone', with: info['Phone']
  
end

Then('The billing information should be copied to the shipping fields as shown below:') do |table|
  info = table.rows_hash

  expect(find_field('shipName').value).to eq(info['Name'])
  expect(find_field('shipAddress').value).to eq(info['Address'])
  expect(find_field('shipCity').value).to eq(info['City'])
  expect(find_field('shipState').value).to eq(info['State'])
  expect(find_field('shipZipCode').value).to eq(info['Zip'])
  expect(find_field('shipPhone').value).to eq(info['Phone'])
end
