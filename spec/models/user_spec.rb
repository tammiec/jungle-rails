require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'is valid with valid attributes' do
      user = User.new(name: 'a', email: 'a@a.com', password: 'abc', password_confirmation: 'abc')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(name: nil, email: 'a@a.com', password: 'abc', password_confirmation: 'abc')
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.new(name: 'a', email: nil, password: 'abc', password_confirmation: 'abc')
      expect(user).to_not be_valid
    end

    it 'is not valid if email is not unique' do
      user1 = User.new(name: 'a', email: 'a@a.com', password: 'abc', password_confirmation: 'abc')
      user1.save!
      user2 = User.new(name: 'a', email: 'a@a.com', password: 'abc', password_confirmation: 'abc')
      user3 = User.new(name: 'a', email: 'A@A.com', password: 'abc', password_confirmation: 'abc')
      expect(user2).to_not be_valid
      expect(user3).to_not be_valid
    end

    it 'is not valid without a password' do
      user = User.new(name: 'a', email: 'a@a.com', password: nil, password_confirmation: 'abc')
      expect(user).to_not be_valid
    end

    it 'is not valid without a password_confirmation' do
      user = User.new(name: 'a', email: 'a@a.com', password: 'abc', password_confirmation: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid if password and password_confirmation do not match'

  end
end
