# frozen_string_literal: true

# Allows to create new clients
class ClientsController < ApplicationController
  def new
    @client = Client.new
    loans = @client.loans.build
    loans.payments.build
  end

  def create
    @client = Client.new(converted_client_params)
    return redirect_to root_url if @client.save
    render action: :new
  end

  private

  # def converted_client_params
  #   client_params[:loans_attributes].map do |loan_attrs|
  #     loan_attrs.merge(
  #       amount: (loan_attrs[:amount] * 100).to_i,
  #       payments_attributes: loan_attrs[:payments_attributes].map do |payment_attrs|
  #         payment_attrs.merge(
  #           amount: (payment_attrs[:amount] * 100).to_i
  #         )
  #       end
  #     )
  #   end
  # end

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
