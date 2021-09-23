require 'towers'
require 'rspec'

describe "TowersOfHanoi" do

  subject(:tower){TowersOfHanoi.new}

  describe "#initialize" do

    context 'when game starts' do

      it 'should create 3 stacks' do
        expect(tower.stack1).to eq([])
        expect(tower.stack2).to eq([])
        expect(tower.stack3).to eq([])
      end

      it 'should create pieces' do
        expect(tower.pieces).to eq([1, 2, 3, 4, 5])
      end
      
    end
  end

  describe '#move' do
    before(:each) do
      tower.stack1 = [5]
      tower.stack2 = [3, 2, 1]
      tower.stack3 = [4]
    end

    it 'should move piece to different stack' do
      expect{ tower.move(stack3, stack1) }.to change { tower.stack1 }.
        from( [5] ).
        to( [5, 4] )
    end

    it 'should not pile disk smaller than itself' do
      expect { tower.move(stack1, stack3) }.to raise_error()
    end

  end

end