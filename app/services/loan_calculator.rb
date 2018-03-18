# frozen_string_literal: true

# LoanCalculator is a service that calculates investor's revenue
# for the given loan
class LoanCalculator
  attr_reader :loan

  def initialize(loan)
    @loan = loan
  end

  def expected_revenue
    (loan.amount * expected_rate * loan.term_in_years).to_i
  end

  def expected_rate
    loan.rate / 100.0
  end

  def actual_revenue
    (loan.amount * actual_rate * loan.term_in_years).to_i
  end

  def actual_rate
    @actual_rate ||= begin
      total = 0
      count = 0
      Loan.eager_load(:payments).find_each do |l|
        total += ((l.paid / l.amount.to_f) - 1) / l.term_in_years
        count += 1
      end
      total / count
    end
  end
end
