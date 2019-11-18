require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      category = Category.new
      product = Product.new(name: 'a', price: 1, quantity: 1, category: category)
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      category = Category.new
        product = Product.new(name: nil, price: 1, quantity: 1, category: category)
        expect(product).to_not be_valid
    end

    it 'is not valid without a price' do
      category = Category.new
      product = Product.new(name: 'a', price: nil, quantity: 1, category: category)
      expect(product).to_not be_valid
    end
    
    it 'is not valid without a quantity' do
      category = Category.new
      product = Product.new(name: 'a', price: 1, quantity: nil, category: category)
      expect(product).to_not be_valid
    end

    it 'is not valid without a category'
  end
end
