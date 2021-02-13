# This class does the currency conversion.
class CurrencyConverter
  attr_accessor :att_currencies, :att_from_currency_rate, :att_to_currency_name

  def initialize(from_currency_rate:, to_currency_name:, currency_exchange_data:)
    @att_currencies = currency_exchange_data
    @att_from_currency_rate = from_currency_rate
    @att_to_currency_name = to_currency_name
  end

  # Return converted currency value
  def call
    (att_from_currency_rate.to_f * to_currency_rate.to_f).round(2)
  end

  private

  # Return currency rate.
  # If the currency is not found then returns 0 value.
  def to_currency_rate
    response = att_currencies.find { |currency| currency['currency'] == att_to_currency_name } || {}
    response['rate'] || 0
  end
end
