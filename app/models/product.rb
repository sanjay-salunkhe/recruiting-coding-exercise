class Product < ApplicationRecord
  def price
    price_in_cents / 100.0
  end

  def price_convert_to_currency(currency_name)
    CurrencyConverter.new(
      base_currency_rate: price,
      to_currency_name: currency_name,
      currency_exchange_data: FetchCurrencyExchangeData.new.call
    ).call
  end
end
