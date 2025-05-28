# Given('I am on the GMO main page') do
#   visit 'http://demo.borland.com/gmopost/'
#   expect(page).to have_content("Welcome to Green Mountain Outpost's OnLine Catalog!")
# end

# When('I click on the {string} button') do |button_text|
#   click_button(button_text)
#   expect(page).to have_content('OnLine Catalog')
# end

When(/^I enter the order quantities:$/) do |table|
  quantities = table.hashes

  catalog_table = find(:css, 'body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody')
  rows = catalog_table.all('tr')

  quantities.each do |item|
    item_name = item['Item Name']
    quantity = item['Order Quantity']

    target_row = rows.find do |row|
      row.all('td')[1].text.strip == item_name
    end
    #rowd.find busca sobre cada fila, guardando esa fila en row, en cuanto encuentre la fila que cumpla con la condicion la guarda en target row

    if target_row
      quantity_input = target_row.find('input[type="text"]')
      #arriba  entramos a un tr especifico(fila) que coincidia con lo que le mande en escenario, y dentro
      #de todas las etiquetas que puede haber en ese tr estamos buscando un input
      quantity_input.fill_in(with: quantity)
    else
      raise "No se encontró la fila con el item '#{item_name}'"
    end
  end
end

# And('I click on the {string} button') do |button_text|
#   click_button(button_text)
# end


Then(/^I should see the following quantities:$/) do |table|
  expected_rows = table.hashes

  place_an_order_table = find(:css, 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody')
  actual_rows = place_an_order_table.all('tr')

  expected_rows.each_with_index do |expected_row, index|
    actual_row = actual_rows[index+1].all('td').map { |columns| columns.text.strip }

    expect(actual_row[0]).to eq(expected_row['Qty'])
    expect(actual_row[1]).to eq(expected_row['Product Description'])
  end
end
