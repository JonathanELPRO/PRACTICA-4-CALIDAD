When('I provide the {string} details as follows:') do |type, table|
  info = table.rows_hash
  form = DetailsForm.new(page, info, type)
  form.fill_details_form
end

