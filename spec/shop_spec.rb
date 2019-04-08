require 'shop'

describe Shop do 

  price_table = {
    'A' => 50, 
    'B' => 30,
    'C' => 20,
    'D' => 15
  }

subject(:shop) { described_class.new(price_table) }

  it 'gives a price for A' do 
    price = 50
    expect(shop.checkout('A')).to eq price 
  end

  it 'gives a price for B' do 
    price = 30
    expect(shop.checkout('B')).to eq price 
  end

  it 'gives a price for C' do 
    price = 20
    expect(shop.checkout('C')).to eq price 
  end

  it 'gives a price for D' do 
    price = 15
    expect(shop.checkout('D')).to eq price 
  end

  it 'gives -1 for an illegal input 6' do 
    expect(shop.checkout('6')).to eq -1 
  end
end