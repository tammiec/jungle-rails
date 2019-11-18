require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      category = Category.new
      product = Product.new(name: 'a', price: 1, quantity: 1, category: category)
      expect(product).to be_valid
    end

    it 'is not valid without a name'
    it 'is not valid without a price'
    it 'is not valid without a quantity'
    it 'is not valid without a category'
  end
end
