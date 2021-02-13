require 'rails_helper'

RSpec.describe CurrencyConverter do
  describe '#call' do
    context 'when invalid currency name is provided' do
      it 'is expected to return converted currency value as 0' do
        # Arrange
        from_currency_rate = 100
        currency_exchange_data = [{ 'currency' => 'INR', 'rate' => 80 }]
        currency_converter = described_class.new(
          from_currency_rate: from_currency_rate,
          to_currency_name: 'INR1',
          currency_exchange_data: currency_exchange_data
        )

        # Act
        converted_currency = currency_converter.call

        # Assert
        expect(converted_currency).to be == 0
      end
    end
  end

  describe '#call' do
    context 'when valid crrency name is provided' do
      it 'is expected to return valid converted currency value' do
        # Arrange
        from_currency_rate = 100
        currency_exchange_data = [{ 'currency' => 'INR', 'rate' => 80 }]
        currency_converter = described_class.new(
          from_currency_rate: from_currency_rate,
          to_currency_name: 'INR',
          currency_exchange_data: currency_exchange_data
        )

        # Act
        converted_currency = currency_converter.call

        # Assert
        expect(converted_currency).to be == 8000
      end
    end
  end
end
