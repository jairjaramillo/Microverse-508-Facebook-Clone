# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:id) { |n| n }
    sequence(:first_name) { |n| "first-#{n}" }
    sequence(:last_name) { |n| "last-#{n}" }
    sequence(:password) { |n| "#{n}23abc" }
    sequence(:email) { |n| "user-#{n}@mail.com" }
  end
end
