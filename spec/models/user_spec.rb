require 'rails_helper'

RSpec.describe User, type: :model do
  subject {FactoryBot.create(:user)}
  
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end