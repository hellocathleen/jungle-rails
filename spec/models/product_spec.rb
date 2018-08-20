require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should have a name, price, quantity, and category' do
      @category = Category.new(name: 'Food')
      @product = @category.products.new(name: 'Cheese', price: 200, quantity: 5)
      expect(@product).to be_valid
      @product.save!
      expect(@product.id).to be_present
    end
    it 'should have a category' do 
      @product = Product.new(name: 'Cheese', price: 23, quantity: 9)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Category can't be blank"]
    end
    it 'should have a name' do 
      @category = Category.new(name: 'Food')
      @product = @category.products.new(name: nil, price: 23, quantity: 4)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Name can't be blank"]
    end
    it 'should have a price' do 
      @category = Category.new(name: 'Food')
      @product = @category.products.new(name: 'Cheese', price: nil, quantity: 55)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'should have a quantity' do 
      @category = Category.new(name: 'Food')
      @product = @category.products.new(name: 'Cheese', price: 34234, quantity: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
  end
end
