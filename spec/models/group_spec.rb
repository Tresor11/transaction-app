require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Group, type: :model do
  let(:group) { build(:group) }
  let(:user) { create(:user) }

  after(:each) do
    Group.destroy_all
  end

  it 'is valid with valid attributes' do
    group.creator_id = user.id
    puts group.icon
    expect(group.save).to be(true)
  end

  it 'is invalid with invalid name' do
    group.creator_id = user.id
    group.name = ''
    expect(group.valid?).to be(false)
    expect(group.save).to be(false)
  end

  it 'is invalid with invalid icon' do
    group.creator_id = user.id
    group.icon = ''
    expect(group.valid?).to be(false)
    expect(group.save).to be(false)
  end

  it 'is invalid with invalid creator_id' do
    group.creator_id = ''
    expect(group.valid?).to be(false)
    expect(group.save).to be(false)
  end

  it 'belong to a user' do
    group.creator_id = user.id
    group.save
    expect(group.creator).to eq(user)
  end

  it 'has many purchases' do
    group.creator_id = user.id
    group.save
    expect(group.transactions).to eq([])
  end

  it { should belong_to(:creator) }
  it { should have_many(:transactions).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:icon) }
  it { should validate_presence_of(:creator_id) }
end
