require 'active_support/core_ext/hash/conversions'
require 'net/http'

# This class is responsible for fetcing currency exchange data.
class FetchCurrencyExchangeData
  EXCHANGE_URL = 'https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'

  # Fetch latest currency exchange data.
  # For performance reason this method assumes latest currency exchange data will be always at the
  # first position in array. if this assumption is incorrect then we wil have to change this method
  # code to find the latest exchange data from the list of array.
  def call
    fetch_currency_exchange_data['Envelope']['Cube']['Cube'][0]['Cube']
  end

  private

  # Actual https call to fetch currency exchange data.
  def fetch_currency_exchange_data
    Hash.from_xml(Net::HTTP.get(URI.parse(EXCHANGE_URL)))
  end
end
