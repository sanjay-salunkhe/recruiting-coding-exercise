class ProductsController < ApplicationController
  before_action :set_session_currency

  def index
    @products = Product.all
    @currency_exchange_data = FetchCurrencyExchangeData.new.call
    respond_to do |format|
      format.html
      format.json { render 'index.json.jbuilder', status: 200 }
    end
  end

  def show
    @currency_exchange_data = FetchCurrencyExchangeData.new.call
    @product = Product.find(params[:id])
  end

  private

  # Set user selected currency in cookie session to remember the currency value
  # even after the page refresh.
  def set_session_currency
    return session[:currency] = params[:currency] if params[:currency].present?

    session[:currency] = App::Products::DEFAULT_CURRENCY if session[:currency].nil?
  end

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end
end
