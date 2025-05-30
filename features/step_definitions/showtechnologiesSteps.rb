Then('I see the list of technologies used for the site') do |table|
  table.raw.flatten.each do |tech|
    expect(page).to have_content(tech)
  end
end
