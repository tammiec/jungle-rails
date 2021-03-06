require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'is valid with valid attributes' do
      user = User.new(name: 'a', email: 'a@a.com', password: 'abcdef', password_confirmation: 'abcdef')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(name: nil, email: 'a@a.com', password: 'abcdef', password_confirmation: 'abcdef')
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.new(name: 'a', email: nil, password: 'abcdef', password_confirmation: 'abcdef')
      expect(user).to_not be_valid
    end

    it 'is not valid if email is not unique' do
      user1 = User.new(name: 'a', email: 'a@a.com', password: 'abcdef', password_confirmation: 'abcdef')
      user1.save!
      user2 = User.new(name: 'a', email: 'a@a.com', password: 'abcdef', password_confirmation: 'abcdef')
      user3 = User.new(name: 'a', email: 'A@A.com', password: 'abcdef', password_confirmation: 'abcdef')
      expect(user2).to_not be_valid
      expect(user3).to_not be_valid
    end

    it 'is not valid without a password' do
      user = User.new(name: 'a', email: 'a@a.com', password: nil, password_confirmation: 'abcdef')
      expect(user).to_not be_valid
    end

    it 'is not valid without a password_confirmation' do
      user = User.new(name: 'a', email: 'a@a.com', password: 'abcdef', password_confirmation: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid if password and password_confirmation do not match' do
      user = User.new(name: 'a', email: 'a@a.com', password: 'abcdef', password_confirmation: 'ABCDEF')
      expect(user).to_not be_valid
    end

    it 'is not valid if password is less than 6 characters' do
      user = User.new(name: 'a', email: 'a@a.com', password: 'abc', password_confirmation: 'abc')
      expect(user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should return the user if it is authenticated' do
      user = User.new(name: 'a', email: 'a@a.com', password: 'abcdef', password_confirmation: 'abcdef')
      user.save!
      expect(User.authenticate_with_credentials('a@a.com', 'abcdef')).to eq(user)
    end

    it 'should return nil if it is not authenticated' do
      user = User.new(name: 'a', email: 'a@a.com', password: 'abcdef', password_confirmation: 'abcdef')
      user.save!
      expect(User.authenticate_with_credentials('a@a.com', 'djfkhsdjk')).to be_nil
    end

    it 'should ignore trailing white spaces' do
      user = User.new(name: 'a', email: 'a@a.com', password: 'abcdef', password_confirmation: 'abcdef')
      user.save!
      expect(User.authenticate_with_credentials('   a@a.com   ', 'abcdef')).to eq(user)
    end

    it 'should not be case-sensitive' do
      user = User.new(name: 'a', email: 'a@a.com', password: 'abcdef', password_confirmation: 'abcdef')
      user.save!
      expect(User.authenticate_with_credentials('A@A.COM', 'abcdef')).to eq(user)
    end

  end
end
