# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    sequence(:id) { |n| n }
    sequence(:content) { |n| "This is a test comment: comment#{n}" }
    association :commenter, factory: :user
    association :post
  end
end
