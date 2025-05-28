class PlaceAnOrderTable
  def initialize(page)
    @page = page
    @table_body = @page.find(:css, 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody')
  end

  def row_at(index)
    row = @table_body.all('tr')[index]
    cells = row.all('td').map { |cell| cell.text.strip }
    [cells[0], cells[1]]  
  end
end