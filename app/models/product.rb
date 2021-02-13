class Product < ApplicationRecord
  # Converts cents to euro
  def price
    price_in_cents / 100.0
  end

  # Converts App::Products::DEFAULT_CURRENCY to given currency.
  def convert_currency(currency, currency_exchange_data)
    return price if currency == App::Products::DEFAULT_CURRENCY

    CurrencyConverter.new(
      from_currency_rate: price,
      to_currency_name: currency,
      currency_exchange_data: currency_exchange_data
    ).call
  end
end
