# frozen_string_literal: true

FactoryBot.define do
  factory :friendship do
    sequence(:id) { |n| n }
    sequence(:status) { |_n| nil }
    association :sender, factory: :user
    association :receiver, factory: :user
  end
end
