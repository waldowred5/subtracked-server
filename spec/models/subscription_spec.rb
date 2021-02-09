require 'rails_helper'

RSpec.describe Subscription, type: :model do
  subject {FactoryBot.create(:subscription)}
  
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a user' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
  end
end