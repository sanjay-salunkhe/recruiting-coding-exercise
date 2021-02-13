json.products @products do |product|
	json.id product.id
	json.description product.description
	json.price product.convert_currency(params[:currency],@currency_exchange_data)
end