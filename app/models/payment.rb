# frozen_string_literal: true

# Payment model
class Payment < ApplicationRecord
  belongs_to :loan

  validates :date, presence: true
  validates :amount, presence: true,
                     numericality: { greater_than_or_equal_to: 0 }
end
