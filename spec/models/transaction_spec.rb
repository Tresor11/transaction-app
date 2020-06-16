# frozen_string_literal: true

require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Transaction, type: :model do
  it { should belong_to(:author) }
  it { should belong_to(:group) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:author_id) }
end
