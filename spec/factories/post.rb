# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    sequence(:id) { |n| n }
    sequence(:content) { |n| "This is a test post: posttt#{n}" }
    association :author, factory: :user
  end
end
