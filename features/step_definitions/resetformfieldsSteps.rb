Then('all fields should be cleared') do
  expect(find_field('QTY_TENTS').value).to eq '0'
  expect(find_field('QTY_BACKPACKS').value).to eq '0'
  expect(find_field('QTY_GLASSES').value).to eq '0'
  expect(find_field('QTY_SOCKS').value).to eq '0'
  expect(find_field('QTY_BOOTS').value).to eq '0'
  expect(find_field('QTY_SHORTS').value).to eq '0'
end
