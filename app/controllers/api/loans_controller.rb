# frozen_string_literal: true

# Represents API access to loans resource
class Api::LoansController < Api::ApplicationController
  before_action :validate_params

  def revenue
    loan = Loan.new(loan_params)
    @calc = LoanCalculator.new(loan)
  end

  private

  def loan_params
    params.permit(:amount, :term, :rate)
  end

  def validate_params
    required_params = %i[amount term rate]
    head(400) if required_params.any? { |key| params[key].blank? }
  end
end
