# frozen_string_literal: true

# Create Payments table
class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.date :date
      t.bigint :amount

      t.belongs_to :loan, index: true

      t.timestamps
    end
  end
end
