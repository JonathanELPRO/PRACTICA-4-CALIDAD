class DetailsForm
  def initialize(page, info, type)
    @page = page
    @info = info
    @type = type.downcase.strip
  end

  def fill_details_form
    case @type
    when 'billing'
      fill_billing
    when 'shipping'
      fill_shipping
    else
      raise "Unknown detail type: #{@type}"
    end
  end


  def fill_billing
    @page.fill_in 'billName', with: @info['Name']
    @page.fill_in 'billAddress', with: @info['Address']
    @page.fill_in 'billCity', with: @info['City']
    @page.fill_in 'billState', with: @info['State']
    @page.fill_in 'billZipCode', with: @info['Zip']
    @page.fill_in 'billPhone', with: @info['Phone']
    @page.fill_in 'billEmail', with: @info['E-mail']
    @page.select @info['Credit Card'], from: 'CardType'
    @page.fill_in 'CardNumber', with: @info['Card Number']
    @page.fill_in 'CardDate', with: @info['Expiration']
  end

  def fill_shipping
    @page.fill_in 'shipName', with: @info['Name']
    @page.fill_in 'shipAddress', with: @info['Address']
    @page.fill_in 'shipCity', with: @info['City']
    @page.fill_in 'shipState', with: @info['State']
    @page.fill_in 'shipZipCode', with: @info['Zip']
    @page.fill_in 'shipPhone', with: @info['Number']
  end
end
