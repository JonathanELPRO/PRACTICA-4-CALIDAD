class CatalogTable
  def initialize(page)
    @page = page
  end

  def fill_quantity(item_name, quantity)
    catalog_table = @page.find(:css, 'body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody')
    rows = catalog_table.all('tr')

    target_row = rows.find do |row|
      row.all('td')[1].text.strip == item_name
    end

    quantity_input = target_row.find('input[type="text"]')
    quantity_input.fill_in(with: quantity)
  end
end
