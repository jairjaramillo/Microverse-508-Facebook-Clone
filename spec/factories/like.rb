# frozen_string_literal: true

FactoryBot.define do
    factory :like do
      sequence(:id) { |n| n }
      association :user
      association :post
    end
  end
  