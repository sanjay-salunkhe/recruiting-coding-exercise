# This class does the currency conversion.
class CurrencyConverter
  attr_accessor :attr_currencies, :attr_base_currency_rate, :attr_to_currency_name

  def initialize(base_currency_rate:, to_currency_name:, currency_exchange_data:)
    @attr_currencies = currency_exchange_data
    @attr_base_currency_rate = base_currency_rate
    @attr_to_currency_name = to_currency_name
  end

  # Return converted currency value
  def call
    attr_base_currency_rate.to_f * to_currency_rate.to_f
  end

  private

  # Return currency rate. if the currency is not found then returns 0 value.
  def to_currency_rate
    currency = attr_currencies.find { |currency| currency['currency'] == attr_to_currency_name } || {}
    currency['rate'] || 0
  end

end
