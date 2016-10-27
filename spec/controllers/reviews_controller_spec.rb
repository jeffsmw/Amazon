require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  describe '#create' do
    let(:product) { create(:product) }
    let(:user) { create(:user) }
    let(:review) { create(:review) }

    context 'when not signed in' do
      def invalid_request
        session[:user_id] = false
        post :create, params: {review: attributes_for(:review), product_id: product.id, user_id:  user.id}
      end
      it 'redirects to the sign in page' do
        invalid_request
        expect(response).to redirect_to('/sessions/new')
      end
    end

    # context 'when signed in' do
    #   def valid_request
    #     post :create, params: {review: attributes_for(:review), product_id: product.id, user_id:  user.id}
    #     session[:user_id] = true
    #   end
    #   it 'redirects to the product page' do
    #     valid_request
    #     byebug
    #
    #     expect(response).to redirect_to(product_path(product))
    #   end
      # it 'associates review with user' do
      #   valid_request
      #   byebug
      #   r = review.user_id
      #   u = user.id
      #   expect(r).to eq(u)
      # end

    end
  end
end
