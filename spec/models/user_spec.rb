# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user, email: 'ALLCAPSMAILHELLYAS@mail.com') }
  let(:user_no_first_name) { build(:user, first_name: '') }
  let(:user_no_last_name) { build(:user, last_name: '') }
  let(:user_no_email) { build(:user, email: '') }
  let(:user_invalid_mail) { build(:user, email: 'wrongmail.com') }
  let(:user_short_password) { build(:user, password: '12345') }
  let(:user_same_mail) { build(:user, email: user.email) }

  context 'Test model presence and validation' do
    it 'Tests if model is valid' do
      expect(user).to be_valid
    end

    it 'Test if user without first name is invalid' do
      expect(user_no_first_name.valid?).to be false
    end

    it 'Test if user without last name is invalid' do
      expect(user_no_last_name.valid?).to be false
    end

    it 'Test if user without email is invalid' do
      expect(user_no_email.valid?).to be false
    end

    it 'Test if user with an invalid email is invalid' do
      expect(user_invalid_mail.valid?).to be false
    end

    it 'Test if user with a short password is invalid' do
      expect(user_short_password.valid?).to be false
    end

    it 'Test if user with a duplicate email is invalid' do
      expect(user_same_mail.valid?).to be false
    end
  end

  context 'Test model class methods' do
    it 'Test if an image_link field was created for saved user' do
      expect(user.image_link).to_not be nil
    end

    it 'Test if saved user email was converted to lowercase' do
      expect(user.email).to match(/\p{Lower}/)
    end
  end
end
