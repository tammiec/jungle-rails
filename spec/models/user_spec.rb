require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes'
    it 'is not valid without a name'
    it 'is not valid without an email'
    it 'is not valid if email is not unique'
    it 'is not valid without a password'
    it 'is not valid without a password_confirmation'
    it 'is not valid if password and password_confirmation do not match'
  end
end
