# frozen_string_literal: true

FactoryBot.define do
  factory :payment do
    date Date.new(2015, 1, 1)
    amount 191_666_67

    loan
  end
end
