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

  context "minimal error management" do

    it "needs a pickup postcode" do
      post '/quotes',
           {quote: {pickup_postcode: 'SW1A 1AA'}}.to_json,
           {'Content-Type' => 'application/json'}

      last_response.should_not be_ok

      error =  JSON::parse(last_response.body)
      expect(error).to include('error')
    end

    it "needs a delivery postcode" do
      post '/quotes',
           {quote: {delivery_postcode: 'EC2A 3LT'}}.to_json,
           {'Content-Type' => 'application/json'}

      last_response.should_not be_ok

      error =  JSON::parse(last_response.body)
      expect(error).to include('error')
    end

  end
end
