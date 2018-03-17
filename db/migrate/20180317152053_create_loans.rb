# frozen_string_literal: true

# Create Loans table
class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.bigint  :amount
      t.integer :term
      t.integer :rate
      t.integer :payment_period
      t.integer :overdue_rate
      t.date    :opening_date

      t.belongs_to :client, index: true

      t.timestamps
    end
  end
end
