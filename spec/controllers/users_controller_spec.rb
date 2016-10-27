require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # let(:user) {create(:user)}

  describe '#new' do
    it 'renders a new template' do
      get :new
      expect(response).to render_template(:new)
    end
    it 'sets and instance of User type' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end
  describe '#create' do
    context 'with valid params' do
      def valid_request
        post :create, params: { user: attributes_for(:user) }
      end

      it 'creates a user in the DB' do
        count_before = User.count
        valid_request
        count_after = User.count
        expect(count_after).to eq(count_before + 1)
      end
      it 'redirects to the home page' do
        valid_request
        expect(response).to redirect_to(root_path)
      end
      it 'signs the user in' do
        valid_request
        expect(session[:user_id]).to be
      end
    end
    context 'with invalid params' do
      def invalid_request
        post :create, params: { user: { first_name: nil } }
      end
      it 'does not create a user in the DB' do
        count_before = User.count
        invalid_request
        count_after = User.count
        expect(count_after).to eq(count_before)
      end
      it 'redirects to the home page' do
        invalid_request
        expect(response).to render_template(:new)
      end

    end
  end
end
