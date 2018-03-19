# frozen_string_literal: true

# Client model
class Client < ApplicationRecord
  has_many :loans

  validates :name, presence: true

  accepts_nested_attributes_for :loans
end
