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
  rows2 = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [9, 10, 11]
  ]
  cols = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]
  cols2 = [
    [0, 3, 6, 9],
    [1, 4, 7, 10],
    [2, 5, 8, 11]
  ]

  context 'when not an array or not square' do

    it 'will raise error for non-2D arrays' do
      expect{my_transpose([1,0])}.to raise_error(ArgumentError)
    end

    it 'will raise error for non-array class args' do
      expect{my_transpose("string")}.to raise_error(ArgumentError)
    end
  end

  context 'when transposing the array' do

    it 'array length should equal length of inner array' do 
      expect(my_transpose(rows2)[0].length).to eq(4)
      expect(my_transpose(rows2).length).to eq(3)
    end

    it 'should transpose array properly' do
      expect(my_transpose(rows)).to eq(cols)
      expect(my_transpose(rows2)).to eq(cols2)
    end
  end

end

describe '#stock_picker' do

  def element_checker(arr)
    arr.each do |ele|
      if !ele.is_a?(Integer) || !ele.is_a?(Float)
        return false
      end
    end
    true
  end
  stock_days = [7, 6, 1, 4, 3 ,6]
  stock = stock_picker(stock_days)
  context 'when given a correct array' do 

    it 'should return an array of days' do
      expect(stock.class).to eq(Array)
    end

    it 'should return correct order' do
      expect(stock).to eq([2, 5])
    end

    it 'should not go back to previous days' do
      expect(stock[0]).to be < stock[1]
    end

  end

end
