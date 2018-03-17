# frozen_string_literal: true

# Create Clients table
class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name

      t.timestamps
    end
  end
end
