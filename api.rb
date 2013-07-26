post '/quotes' do
  begin
    body = JSON.parse(request.body.read)['quote']

    quote = Quote.new body['pickup_postcode'],
                      body['delivery_postcode']
    {quote: quote.to_h}.to_json
  rescue => e
    error 400, {error: e}.to_json
  end
end
