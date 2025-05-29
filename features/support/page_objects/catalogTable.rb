class CatalogTable
  def initialize(page)
    @page = page
    @table_body = @page.find(:css, 'body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody')
  end

  def purchase_info_at(index, column)
    row = @table_body.all('tr')[index]
    cells = row.all('td').map { |cell| cell.text.strip }

    case column.downcase
    when 'item number'
      cells[0]
    when 'item name'
      cells[1]
    when 'unit price'
      cells[2]
    else
      raise ArgumentError, "Unknown field: #{field}"
    end
  end

 

  def fill_quantity(item_name, quantity)
    rows = @table_body.all('tr')

    target_row = rows.find do |row|
      row.all('td')[1].text.strip == item_name
    end

    quantity_input = target_row.find('input[type="text"]')
    quantity_input.fill_in(with: quantity)
  end
end
