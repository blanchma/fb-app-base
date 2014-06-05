# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Clark Kent"
    email "email@domain.com"
    sequence(:uid) {|n| "uidxxx#{n}" }
  end
end
