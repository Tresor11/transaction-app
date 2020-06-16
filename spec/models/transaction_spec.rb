require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Transaction, type: :model do
  let(:transaction) { build(:transaction) }
  let(:user) { build(:user) }
  let(:group) { build(:group) }

  before(:each) do
    user.save
    group.creator_id = user.id
    group.save
  end

  after(:each) do
    Transaction.destroy_all
  end

  it 'is valid with valid attributes' do
    transaction.author_id = user.id
    transaction.group_id = group.id
    expect(group.valid?).to be(true)
    expect(group.save).to be(true)
  end

  it 'is invalid with invalid name' do
    transaction.author_id = user.id
    transaction.group_id = group.id
    transaction.name = ''
    expect(transaction.valid?).to be(false)
    expect(transaction.save).to be(false)
  end

  it 'is invalid with invalid amount' do
    transaction.author_id = user.id
    transaction.group_id = group.id
    transaction.amount = ''
    expect(transaction.valid?).to be(false)
    expect(transaction.save).to be(false)
  end

  it 'is invalid with invalid author_id' do
    transaction.author_id = ''
    transaction.group_id = group.id
    expect(transaction.valid?).to be(false)
    expect(transaction.save).to be(false)
  end

  it 'is valid with invalid group_id' do
    transaction.author_id = user.id
    transaction.group_id = ''
    expect(transaction.valid?).to be(true)
    expect(transaction.save).to be(true)
  end

  it 'belong to a creator' do
    transaction.author_id = user.id
    transaction.group_id = group.id
    transaction.save
    expect(transaction.author).to eq(user)
  end

  it 'belong to a group' do
    transaction.author_id = user.id
    transaction.group_id = group.id
    transaction.save
    expect(transaction.group).to eq(group)
  end

  it { should belong_to(:author) }
  it { should belong_to(:group) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:author_id) }
end
