# Given('I am on the GMO main page') do
#   visit 'http://demo.borland.com/gmopost/'
#   expect(page).to have_content("Welcome to Green Mountain Outpost's OnLine Catalog!")
# end

# When('I click on the {string} button') do |button_text|
#   click_button(button_text)
#   expect(page).to have_content('OnLine Catalog')
# end

Then(/^I should see the following table:$/) do |expected_table|
  #este hash empieza desde cero su indice
  expected_rows = expected_table.hashes

  table_body = find(:css, 'body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody')
#   puts table_body.text 

  #esto de abajo es un array que empieza de cero
  actual_rows = table_body.all('tr')

  expected_rows.each_with_index do |expected_row, index|
    #puts index
    actual_cells = actual_rows[index+1].all('td').map { |cell| cell.text.strip }
    # puts actual_cells[2]
    # puts expected_row['Unit Price']
    expect(actual_cells[0]).to eq(expected_row['Item Number'])
    expect(actual_cells[1]).to eq(expected_row['Item Name'])
    expect(actual_cells[2]).to eq(expected_row['Unit Price'])
  end
end

