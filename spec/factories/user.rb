# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'You' }
  end

  factory :random_user, class: User do
    name { Faker::Name.name }
  end
end
