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

    it 'is not valid without an email'
    it 'is not valid if email is not unique'
    it 'is not valid without a password'
    it 'is not valid without a password_confirmation'
    it 'is not valid if password and password_confirmation do not match'
  end
end
