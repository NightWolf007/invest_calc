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
      # find average actual rate regardless of loan's term and rate
      Loan.eager_load(:payments).find_each do |l|
        total += l.actual_rate / l.term_in_years / l.rate
        count += 1
      end
      # average multuplied by given loan's rate to return the dependence on rate
      total / count * loan.rate
    end
  end
end
