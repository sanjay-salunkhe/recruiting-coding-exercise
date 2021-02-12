require 'rails_helper'

RSpec.describe CurrencyConverter do 
	context 'when invalid currency name is provided' do 
		it 'is expected to return 0 value' do
			# Arrange
			base_currency_rate = 100;
			currency_exchange_data = [{"currency" =>  "INR", "rate" => 80}]
			currency_converter = CurrencyConverter.new(
      		base_currency_rate: base_currency_rate,
      		to_currency_name: "INR1"
    		)

			# Act
    		converted_currency = currency_converter.call

    		# Assert
    		expect(converted_currency).to be == 0
		end
	end

	context 'when valid crrency name is provided' do 

		it 'is expected to return valid converted currency value' do
			# Arrange
			base_currency_rate = 100;
			currency_exchange_data = [{"currency" =>  "INR", "rate" => 80}]
			currency_converter = CurrencyConverter.new(
      		base_currency_rate: base_currency_rate,
      		to_currency_name: "INR"    		)

			# Act
    		converted_currency = currency_converter.call

    		# Assert
    		expect(converted_currency).to be == 8000
    	end		
	end
end