require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#price' do
    it 'returns a float' do
      expect(described_class.new(price_in_cents: 1234).price).to eq(12.34)
    end
  end

  describe '#convert_currency' do
    it 'returns converted currency value' do
      # Arrange
      product = described_class.new(price_in_cents: 100)
      currency_exchange_data = [{ 'currency' => 'INR', 'rate' => 88 }]

      # Act
      converted_currency = product.convert_currency('INR', currency_exchange_data)

      # Assert
      expect(converted_currency).to be == 88
    end

    context "when currency to convert is equal to #{App::Products::DEFAULT_CURRENCY}" do
      it 'is expected to return valid converted currency value' do
        # Arrange
        product = described_class.new(price_in_cents: 125)
        currency = App::Products::DEFAULT_CURRENCY
        currency_exchange_data = [{ 'currency' => 'INR', 'rate' => 88 }]

        # Act
        converted_currency = product.convert_currency(currency, currency_exchange_data)

        # Assert
        expect(converted_currency).to be == 1.25
      end
    end
  end
end
