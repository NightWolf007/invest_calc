# frozen_string_literal: true

# Allows to create new clients
class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    redirect_to :welcome if @client.save
    render action: :new
  end

  private

  def client_params
    params.require(:client).permit(
      :name,
      loans: [
        :amount, :term, :rate,
        :payment_period, :overdue_rate, :opening_rate,
        payments: %i[date amount]
      ]
    )
  end
end
