require 'rails_helper'

RSpec.describe FetchCurrencyExchangeData do
  it 'returns currency exchange data' do
    # Arrange
    currency_exchange_api_response = {
      'Envelope' => {
        'Cube' => {
          'Cube' => [
            {
              'time' => '2021-02-12',
              'Cube' => [{ 'currency' => 'USD', 'rate' => '1.2108' }, { 'currency' => 'USD', 'rate' => '1.2108' }]
            }
          ]
        }
      }
    }
    currency_exchange = described_class.new
    allow(currency_exchange).to receive(:fetch_currency_exchange_data).and_return(currency_exchange_api_response)

    # Act
    response = currency_exchange.call

    # Assert
    expect(response).to match_array(
      [{ 'currency' => 'USD', 'rate' => '1.2108' }, { 'currency' => 'USD', 'rate' => '1.2108' }]
    )
  end
end
