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

describe '#two_sum' do

  context 'When given correct array' do

    test_arr = [1, 2, -2, -1]
    it 'will return pairs that sum 0' do
      expect(two_sum([2, -2])).to eq([[0, 1]])
    end

    it 'will have indexes in order' do
      expect(two_sum(test_arr)).to eq([[0, 3],[1, 2]])
    end

    it 'will give correct amount of pairs' do
      expect(two_sum(test_arr).length).to be(2)
    end

  end
  context 'When not given an array as argument' do

    it 'will raise error' do
      expect{two_sum("a")}.to raise_error(ArgumentError)
    end

  end
end

describe '#my_transpose' do
  rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]

  context 'when not an array or not square' do

    it 'will raise error for non-square arrays' do
      expect{my_transpose([1,0])}.to raise_error(ArgumentError)
    end

    it 'will raise error for non-array class args' do
      
    end

  end


end