require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do

    it 'requires a first name' do
      u = build :user, first_name: nil
      u.valid?
      expect(u.errors).to have_key(:first_name)
    end

    it 'requires a last name' do
      u = build :user, last_name: nil
      u.valid?
      expect(u.errors).to have_key(:last_name)
    end

    it 'must have a unique email' do
      create :user, email: 'test@email.com'
      u = build :user, email: 'test@email.com'
      u.valid?
      expect(u.errors).to have_key(:email)
    end
  end

  describe 'methods' do
    it 'full name returns first and last concatenized and titleized' do
      u = create :user, first_name: 'abc', last_name: 'efg'
      u.full_name
      expect(u.full_name).to eq('AbcEfg')
    end
  end
end
