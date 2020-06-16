# frozen_string_literal: true

require 'rails_helper'

# Test suite for the Todo model
RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  after(:each) do
    User.destroy_all
  end

  it 'is valid with valid attributes' do
    expect(user.valid?).to be(true)
    expect(user.save).to be(true)
  end

  it { should have_many(:groups).dependent(:destroy) }
  it { should have_many(:transactions).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end
