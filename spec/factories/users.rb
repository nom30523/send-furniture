FactoryBot.define do
  factory :user do
    sequence(:name) {Faker::Internet.username(specifier: 6..6)}
    password              {"00000000"}
    password_confirmation {"00000000"}
    sequence(:email) {Faker::Internet.email}
  end
end