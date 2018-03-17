# frozen_string_literal: true

# Payment model
class Payment < ApplicationRecord
  belongs_to :loan

  validates :date, presence: true
  validates :amount, presence: true
end
