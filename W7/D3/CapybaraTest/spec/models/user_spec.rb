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

  feature "is_valid_password?" do
    scenario "with a valid password" do
      it "should return true" do 
        expect(user.is_valid_password?('password')).to be true 
      end
    end 
    scenario "with an invalid password" do
      it "should return false" do 
        expect(user.is_valid_password?('123456')).to be false
      end
    end 
  end
end
