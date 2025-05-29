# Given('I am on the GMO Home Page') do
#   visit 'http://demo.borland.com/gmopost/'
#   expect(page).to have_content("Welcome to Green Mountain Outpost's OnLine Catalog!")
# end

# When(/^I enter the order quantities as shown below:$/) do |table|
#   quantities = table.hashes

#   catalog_table = find(:css, 'body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody')
#   rows = catalog_table.all('tr')

#   quantities.each do |item|
#     item_name = item['Item Name']
#     quantity = item['Order Quantity']

#     target_row = rows.find do |row|
#       row.all('td')[1].text.strip == item_name
#     end

#     if target_row
#       quantity_input = target_row.find('input[type="text"]')
#       quantity_input.fill_in(with: quantity)
#     else
#       raise "No se encontró la fila con el item '#{item_name}'"
#     end
#   end
# end






# And('I click on the {string} button') do |button_text|
#   click_button(button_text)
# end


Given('I am at {string} Page') do |expected_text|
  expect(page).to have_content(expected_text)
end

# When('I enter the bill to information as shown below:') do |table|
#   info = table.rows_hash

#   fill_in 'billName', with: info['Name']
#   fill_in 'billAddress', with: info['Address']
#   fill_in 'billCity', with: info['City']
#   fill_in 'billState', with: info['State']
#   fill_in 'billZipCode', with: info['Zip']
#   fill_in 'billPhone', with: info['Phone']
#   fill_in 'billEmail', with: info['E-mail']
#   select info['Credit Card'], from: 'CardType'
#   fill_in 'CardNumber', with: info['Card Number']
#   fill_in 'CardExpDate', with: info['Expiration']
# end

# When('I check the {string} checkbox') do |checkbox_name|
#   check(checkbox_name)
# end

# Then('I am at {string} Page') do |expected_text|
#   expect(page).to have_content(expected_text)
# end
