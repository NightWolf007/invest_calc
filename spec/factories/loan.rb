# frozen_string_literal: true

FactoryBot.define do
  factory :loan do
    amount 1_000_000_00
    term 6
    rate 30
    payment_period 1
    overdue_rate 50
    sequence(:opening_date) { |n| (n + 1).years.ago }

    client

    trait :repaid do
      payments do
        amounts = Array.new(6, 191_666_67)
        build_payments(self, amounts)
      end
    end

    trait :repaid_early do
      payments do
        amounts = Array.new(3, 191_666_67).append(525_000_00)
        build_payments(self, amounts)
      end
    end

    trait :repaid_with_delays do
      payments do
        amounts = Array.new(2, 191_666_67) + Array.new(4, 208_333_33)
        build_payments(self, amounts)
      end
    end

    factory :repaid_loan,             traits: [:repaid]
    factory :repaid_early_loan,       traits: [:repaid_early]
    factory :repaid_with_delays_loan, traits: [:repaid_with_delays]
  end
end

def build_payments(loan, amounts)
  amounts.map.with_index do |amount, i|
    FactoryBot.build(
      :payment,
      date: loan.opening_date + (loan.payment_period + i).months,
      amount: amount,
      loan: nil
    )
  end
end
