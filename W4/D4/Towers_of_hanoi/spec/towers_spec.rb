require 'towers'
require 'rspec'

describe "TowersOfHanoi" do

  subject(:tower){TowersOfHanoi.new}

  describe "#initialize" do

    context 'when game starts' do

      it 'should create 3 stacks' do
        expect(tower.stack1).to eq([])
        expect(tower.stack2).to eq([])
        expect(tower.stack3).to eq([5, 4, 3, 2, 1])
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
      expect{ tower.move(tower.stack3, tower.stack1) }.to change { tower.stack1 }.
        from( [5] ).
        to( [5, 4] )
    end

    it 'removes from old stack' do
      expect{ tower.move(tower.stack3, tower.stack1) }.to change { tower.stack3 }.
        from( [4] ).
        to( [] )
    end
    context "error management" do 
      before(:each) do
        tower.stack1 = [5, 4]
        tower.stack2 = [3, 2, 1]
        tower.stack3 = []
      end

      it 'should not pull from empty stack' do
        expect{ tower.move(tower.stack3, tower.stack1) }.to raise_error("Stack is empty")
      end

      it 'should not pile disk smaller than itself' do
        expect { tower.move(tower.stack1, tower.stack2) }.to raise_error("Larger than top piece in stack")
      end

    end

  end

  describe '#won?' do
  before(:each) do
    tower.stack1 = [5, 4, 3, 2, 1]
    tower.stack2 = []
    tower.stack3 = []
  end

    it 'should return true if stack1 is complete' do
      expect(tower.won?).to be(true)
    end

    it 'other stacks should be empty' do
      expect(tower.stack2).to eq([])
      expect(tower.stack3).to eq([])
    end

    it 'should return false when not complete' do
      tower.move(tower.stack1, tower.stack2)
      expect(tower.won?).to be(false)
    end
  end

end