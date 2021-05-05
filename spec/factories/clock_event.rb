FactoryBot.define do
  factory :clock_event do
    association :user, factory: :user
  end
end
