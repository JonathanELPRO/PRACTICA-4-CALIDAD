Then('I see the list of future technologies for the site') do |table|
  table.raw.flatten.each do |tech|
    tech = tech.tr("\u00A0", ' ').strip  
    expect(page).to have_content(tech)
  end
end
