class Stock < ApplicationRecord
 
  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
 
  def self.new_from_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: 'pk_305fca6aa0ed4ceb91521067c663d3d6')
    looked_up_stock = client.quote(ticker_symbol)
    new(name: looked_up_stock.company_name,
        ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
  end
end
