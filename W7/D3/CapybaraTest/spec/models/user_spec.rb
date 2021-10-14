# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:goals) }

  # feature "find by credentials" do 
    
  # end
  feature "uniqueness" do
    before :each do
      FactoryBot.create(:user)
    end

    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end

  feature "is_valid_password?" do
    let!(:user) { FactoryBot.create(:user) }
    context "with a valid password" do
      scenario "should return true" do 
        expect(user.is_valid_password?('password')).to be true 
      end
    end 
    context "with an invalid password" do
      scenario "should return false" do 
        expect(user.is_valid_password?('123456')).to be false
      end
    end 
  end

end
