class PlaceAnOrderTable
  def initialize(page)
    @page = page
    @table_body = @page.find(:css, 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody')
  end

 def total_price_at(index)
   row = @table_body.all('tr')[index]
   cells = row.all('td').map { |cell| cell.text.strip }
   cells.last
 end

 def purchase_info_at(index, column)
    row = @table_body.all('tr')[index]
    cells = row.all('td').map { |cell| cell.text.strip }

    case column.downcase
    when 'qty'
      cells[0]
    when 'product description'
      cells[1]
    when 'unit price'
      cells[3]
    else
      raise ArgumentError, "Unknown field: #{field}"
    end
  end

  def valid_rows
    rows = []
    @table_body.all('tr').each_with_index do |row, index|
      cells = row.all('td')
      rows << index if cells.size == 5
    end
    rows
  end

end