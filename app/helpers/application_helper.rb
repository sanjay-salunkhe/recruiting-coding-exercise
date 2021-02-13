module ApplicationHelper
  def list_of_currencies(currency_exchange_data)
    currency_exchange_data.map { |c| c['currency'] }.concat([App::Products::DEFAULT_CURRENCY]).sort
  end

  def current_currency
    session[:currency]
  end
end
