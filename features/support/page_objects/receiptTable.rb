class ReceiptTable
  def initialize(page)
    @page = page
    @table_body = @page.find(:css, 'body > table:nth-child(5) > tbody > tr:nth-child(2) > td > table > tbody > tr > td > div > center > table > tbody')
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
      raise ArgumentError, "Unknown field: #{column}"
    end
  end

  def total_price_at(index)
   row = @table_body.all('tr')[index]
   cells = row.all('td').map { |cell| cell.text.strip }
   cells.last
  end

end
