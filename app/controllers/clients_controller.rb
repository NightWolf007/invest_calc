# frozen_string_literal: true

# Allows to create new clients
class ClientsController < ApplicationController
  def new
    @client = Client.new
    loans = @client.loans.build
    loans.payments.build
  end

  def create
    @client = Client.new(client_params)
    return redirect_to root_url if @client.save
    render action: :new
  end

  private

  def client_params
    params.require(:client).permit(
      :name,
      loans_attributes: [
        :amount, :term, :rate,
        :payment_period, :overdue_rate, :opening_date,
        payments_attributes: %i[date amount]
      ]
    )
  end
end
