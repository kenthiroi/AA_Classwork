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


end