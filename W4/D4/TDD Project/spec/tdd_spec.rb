require 'rspec'
require 'tdd'

describe '#uniq' do

  it 'should take an array as argument' do
    expect { uniq('string') }.to raise_error(ArgumentError)
  end

  it 'should remove duplicates from array' do
    expect(uniq([1,1,3,5,7,7])).to eq([1,3,5,7])
  end

  

end
