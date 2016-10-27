# - title and price must be present
# - title is unique
# - sale_price must be present (initially if the product is not on sale it should default to price)
# - sale_price must be less than or equal to price
# - a method called on_sale? that returns true or false whether the product is on sale or not

require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'validations' do
    it 'requires a title and price' do
        # p = Product.new
        # p.valid?
        # expect(p.errors).to have_key(:title)
        # expect(p.errors).to have_key(:price)
        # expect(p.errors).to have_key(:sale_price)
        p = FactoryGirl.build :product, title: nil,  price: nil, sale_price: nil
        p.valid?
        expect(p.errors).to have_key(:title)
        expect(p.errors).to have_key(:price)
    end

    it 'requires a unique title' do
    #   Product.create title: 'unique', price: 5, sale_price: 5
    #   p = Product.new title: 'unique', price: 5, sale_price: 5
    #   p.valid?
    #   expect(p.errors).to have_key(:title)
      FactoryGirl.create :product, title: 'example fail'
      p = FactoryGirl.build :product, title: 'example fail'
      p.valid?
      expect(p.errors).to have_key(:title)
     end

     it 'requires a capital title' do
       p = FactoryGirl.build :product, title: 'capitalize this'
       p.titleize_t
       expect(p.title).to eq('Capitalize This')
     end

    it 'requires a sale price' do
    #   p = Product.new title: 'hello', price: 6
    #   p.valid?
    #   expect(p.price).to eq(p.sale_price)
      p = FactoryGirl.build :product, sale_price: nil
      p.valid?
      expect(p.sale_price).to eq(p.price)
    end

    it 'requires sale price to be less than or equal to price' do
    #   p = Product.new title: 'hello', price:5, sale_price: 6
    #   p.valid?
    #   expect(p.errors).to have_key(:sale_price)
      p = FactoryGirl.build :product, price: 20, sale_price:21
      p.valid?
      expect(p.errors).to have_key(:sale_price)
    end

    it 'requires on_sale to return true if sale_price is less than price' do
    #   p = Product.new title: 'sale?', price:5, sale_price: 4
    #   bool = p.on_sale?
    #   expect(bool).to be true
      p = FactoryGirl.build :product, price:20, sale_price: 19
      bool = p.on_sale?
      expect(bool).to be true
    end

    it 'requires on_sale to return false if sale_price is more than price' do
    #   p = Product.new title: 'sale?', price:5, sale_price: 6
    #   bool = p.on_sale?
    #   expect(bool).to be false
    p = FactoryGirl.build :product, price:20, sale_price: 20
    bool = p.on_sale?
    expect(bool).to be false
    end
  end
  describe 'association' do
    it 'can have many reviews' do
      FactoryGirl.create :product, id: 1
      FactoryGirl.create :review, product_id: 1
      FactoryGirl.create :review, product_id: 1
      FactoryGirl.create :review, product_id: 1

      r = Review.where(product_id: 1).count
      expect(r).to eq(3)
    end
  end
end
