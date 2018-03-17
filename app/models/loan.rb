# frozen_string_literal: true

# Loan model
class Loan < ApplicationRecord
  belongs_to :client
  has_many :payments

  validates :amount, presence: true
  validates :term, presence: true
  validates :rate, presence: true
  validates :payment_period, presence: true
  validates :overdue_period, presence: true
  validates :opening_date, presence: true

  def paid
    payments.map(&:amount).reduce(:+)
  end

  def term_in_years
    term / 12.0
  end
end
