# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    name { 'first' }
    amount { 20 }
  end
end
