# frozen_string_literal: true

# Loan model
class Loan < ApplicationRecord
  belongs_to :client
  has_many :payments

  validates :amount, presence: true,
                     numericality: { greater_than_or_equal_to: 0 }
  validates :term, presence: true,
                   numericality: { greater_than_or_equal_to: 0 }
  validates :rate, presence: true
  validates :payment_period, presence: true,
                             numericality: { greater_than_or_equal_to: 0 }
  validates :overdue_rate, presence: true
  validates :opening_date, presence: true

  accepts_nested_attributes_for :payments

  def paid
    payments.map(&:amount).reduce(:+)
  end

  # Returns how much interest was paid on the loan
  def interest_paid
    paid - amount
  end

  # Returns interest_paid to loan's amount ratio
  def actual_rate
    interest_paid / amount.to_f
  end

  def term_in_years
    term / 12.0
  end
end
