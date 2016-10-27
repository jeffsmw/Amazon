require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe '#new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
    it 'instantiates a new campaign object' do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe '#create' do
    context 'with valid params' do
      def valid_request
        post :create, params: {product: attributes_for(:product)}
      end
      it 'saves a record to the database' do
        count_before = Product.count
        valid_request
        count_after = Product.count
        expect(count_after).to eq(count_before + 1)
      end
      it 'redirects to the product show page' do
        valid_request
        expect(response).to redirect_to(product_path(Product.last))
      end
    end
  end

  describe '#show' do
    it 'renders the show template' do
      product = create(:product)
      get :show, params: { id: product.id }
      expect(response).to render_template(:show)
    end
    it 'sets an instance variable with product whose id is passed' do
      product = create(:product)
      get :show, params: {id: product.id}
      expect(assigns(:product)).to eq(product)
    end
  end

  describe '#index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
    # it 'returns product table as a list'
  end

  # describe '#destroy' do
  #   it 'destroys a record from a database' do
  #     product = FactoryGirl.create :product
  #     delete :destroy, params: {id: product.id}
  #     expect(
  #   end
  #   it 'redirects to the product index page'
  # end



end
