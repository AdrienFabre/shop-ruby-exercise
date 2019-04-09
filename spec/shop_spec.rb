require 'shop'

describe Shop do 

  price_table = {
    'A' => 50, 
    'B' => 30,
    'C' => 20,
    'D' => 15
  }

  special_offer = {
    '3A' => 130,
    '2B' => 45
  }
subject(:shop) { described_class.new(price_table, special_offer) }

  it 'gives a price of 50 for single legal item A ' do 
    expect(shop.checkout('A')).to eq 50 
  end

  it 'Acceptance criteria: gives -1 for an illegal input 6' do 
    expect(shop.checkout('6')).to eq -1 
  end

  it 'Acceptance criteria: gives 115 for multiple legal entry' do
    expect(shop.checkout('ABCD')).to eq 115
  end

  it 'Acceptance criteria: gives -1 for aBc' do 
    expect(shop.checkout('aBc')).to eq -1
  end

  it 'Acceptance criteria: gives -1 for -B8x' do 
    expect(shop.checkout('-B8x')).to eq -1
  end

  it 'Acceptance criteria: gives -1 for 18' do 
    expect(shop.checkout('18')).to eq -1
  end

  it 'Acceptance criteria: gives 100 for AA' do 
    expect(shop.checkout('AA')).to eq 100
  end

  it 'Acceptance criteria: gives 130 for -B8x' do 
    expect(shop.checkout('AAA')).to eq 130
  end

  it 'Acceptance criteria: gives 260 for AAAAAA' do 
    expect(shop.checkout('AAAAAA')).to eq 260
  end

  it 'Extra acceptance criteria: gives 175 for AAABB' do 
    expect(shop.checkout('AAABB')).to eq 175
  end

  it 'Extra acceptance criteria: gives 195 for AAABBC' do 
    expect(shop.checkout('AAABBC')).to eq 195
  end

  it 'Extra acceptance criteria: gives 345 for BABDBCAACA' do 
    expect(shop.checkout('BABDBCAACA')).to eq 345
  end

end

