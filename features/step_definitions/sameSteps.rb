include Constants

def find_price_by_product_name(name)
  product = PRODUCTS.values.find { |p| p[:name].casecmp(name).zero? }
  product ? product[:price] : nil
end

When('I enable the {string} checkbox') do |checkbox_name|    
  check(checkbox_name)
end

Then('I have reached the {string} page') do |page_name|
  expect(page).to have_title(/#{page_name}/i)
end

Then('I should see the following message {string}') do |expected_message|
  alert = page.driver.browser.switch_to.alert
  actual_message = alert.text
  expect(actual_message).to eq(expected_message)
end

Given('I am on the GMO main page') do  
  visit 'http://demo.borland.com/gmopost/'
  expect(page).to have_content("Welcome to Green Mountain Outpost's OnLine Catalog!")
end

When('I click on the {string} button') do |button_text|
  click_button(button_text)
end

Then(/^the total price of each product in the "(Place Order|Receipt)" table should be correct$/) do |table_type|
  table = case table_type
          when "Place Order" then PlaceAnOrderTable.new(page)
          when "Receipt" then ReceiptTable.new(page)
          else raise "Unknown table type: #{table_type}"
          end

  row_count = table.valid_rows.last().to_i
  (1..row_count).each do |index|
    product_description = table.purchase_info_at(index,'product description')
    qty = table.purchase_info_at(index, 'Qty').to_i
    unit_price = find_price_by_product_name(product_description)
    total_price = table.total_price_at(index).gsub(/[^\d.]/, '').to_f

    expected_total = (qty * unit_price).round(2)
    expect(total_price).to eq(expected_total)
  end
end

And(/^the Product Total and the Grand Total in the "(Place Order|Receipt)" table should be correct$/) do |table_type|
  table = case table_type
          when "Place Order" then PlaceAnOrderTable.new(page)
          when "Receipt" then ReceiptTable.new(page)
          else raise "Unknown table type: #{table_type}"
          end

  row_count = table.valid_rows.last().to_i 
  puts "PUT DE VALIDACION--> Cantidad de productos pedidos : #{table.valid_rows.last().to_i}"
  expected_total_price_from_product_total = 0
  (1..row_count).each do |index|
    product_description = table.purchase_info_at(index,'product description')
    qty = table.purchase_info_at(index, 'Qty').to_i
    unit_price = find_price_by_product_name(product_description)
    expected_total = (qty * unit_price)
    expected_total_price_from_product_total = expected_total_price_from_product_total + expected_total
  end
  
  puts "PUT DE VALIDACION--> Total esperado de todos los productos: #{expected_total_price_from_product_total}"

  total_price_from_product_total = table.total_price_at(row_count+1).gsub(/[^\d.]/, '').to_f
  puts "PUT DE VALIDACION--> Total de la tabla de todos los productos  #{total_price_from_product_total}"
  expected_total_price_from_sales_tax = expected_total_price_from_product_total * 0.05
  puts "PUT DE VALIDACION--> Sales taxes esperado  #{expected_total_price_from_sales_tax}"
  expected_total_price_from_shipping_handling = SHIPPING_HANDLING
  total_price_grand_total = table.total_price_at(row_count+4).gsub(/[^\d.]/, '').to_f
  puts "PUT DE VALIDACION--> Grand total de la tabla #{total_price_grand_total}"
  expected_total_price_grand_total = expected_total_price_from_product_total + expected_total_price_from_sales_tax + expected_total_price_from_shipping_handling
  puts "PUT DE VALIDACION--> Grand total esperado #{expected_total_price_grand_total}"
  expect(total_price_from_product_total).to eq(expected_total_price_from_product_total.round(2))
  expect(total_price_grand_total).to eq(expected_total_price_grand_total.round(2))
end
  