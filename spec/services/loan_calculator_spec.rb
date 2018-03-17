# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoanCalculator do
  let(:loan) do
    Loan.new(
      amount: 1_000_000_00,
      term: 6,
      rate: 30
    )
  end

  subject { described_class.new(loan) }

  describe '#expected_revenue' do
    let(:revenue) { (loan.amount * 0.15).to_i }

    it 'returns expected revenue' do
      expect(subject.expected_revenue).to eq revenue
    end
  end

  describe '#actual_revenue' do
    before do
      create(:repaid_loan)
      create(:repaid_early_loan)
      create(:repaid_with_delays_loan)
    end

    let(:revenue) { (loan.amount * 0.155555563).to_i }

    it 'returns actual revenue' do
      expect(subject.actual_revenue).to eq revenue
    end
  end
end
