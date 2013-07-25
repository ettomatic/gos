require 'spec_helper'

describe "POST on quoting" do

  def body
    {quote: {pickup_postcode:   'SW1A 1AA',
             delivery_postcode: 'EC2A 3LT'}}.to_json
  end

  it "respond to quotes requests" do

    post '/quotes', body, {'Content-Type' => 'application/json'}

    last_response.should be_ok

    quote = JSON::parse(last_response.body)['quote']

    expect(quote['pickup_postcode']).to eql "SW1A 1AA"
    expect(quote['delivery_postcode']).to eql "EC2A 3LT"
    expect(quote['price']).to eql 679

  end
end
