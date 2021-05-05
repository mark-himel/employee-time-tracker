FactoryBot.define do
  factory :user do
    name { 'A test user' }
    email { 'test@email.com' }
    password { 'asd123' }
  end
end
