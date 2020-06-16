FactoryBot.define do
  factory :group do
    name { 'education' }
    icon { File.open(File.join(Rails.root, '/spec/support/kid.jpg')) }
  end
end
