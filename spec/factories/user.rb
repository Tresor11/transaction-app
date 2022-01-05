FactoryBot.define do
  factory :user do
    name { 'You' }
    email { Faker::Internet.email }
    password { 'password' }
  end

  factory :random_user, class: User do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
