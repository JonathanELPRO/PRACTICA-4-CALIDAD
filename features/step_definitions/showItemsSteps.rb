And('I click on each product link:') do |table|
  @clicked_items = table.hashes 
  @visited_results = []

  @clicked_items.each do |item|
    item_name = item['Item Name']
    item_number = item['Item Number']

    click_link(item_name)

    @visited_results << {
      name: item_name,
      number: item_number,
      visible: page.has_content?(item_name) && page.has_content?(item_number),
      products_displayed: page.has_content?("Products")
    }

    page.go_back
  end
end

Then('I can see the catalog and each product is highlighted') do
  @visited_results.each do |result|
    expect(result[:visible]).to be true
    expect(result[:products_displayed]).to be true    
  end
end
