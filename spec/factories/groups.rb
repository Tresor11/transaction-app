FactoryBot.define do
  factory :group do
    name { 'education' }
    icon { Rails.root.join('spec/support/kid.jpg') }
  end
end
