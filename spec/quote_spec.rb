require 'spec_helper'

describe "Quote" do

  describe "price calculation" do

    it "produces positive prices" do
      quote = Quote.new('1111 111','ZZZ ZZZ', 'car')
      expect(quote.price).to be > 0
    end

    context "generic car" do
      it "does not get a price markup" do
        quote = Quote.new('SW1A 1AA','EC2 3LT','car')
        expect(quote.price).to eq quote.full_price
      end
    end

    context "bicycle" do
      it "get a 10% markup" do
        quote = Quote.new('SW1A 1AA','EC2 3LT','bicycle')
        price = quote.full_price + (quote.full_price * 10 / 100)
        expect(quote.price).to eq price
      end
    end

    context "parcel_car" do
      it "get a 20% markup" do
        quote = Quote.new('SW1A 1AA','EC2 3LT','parcel_car')
        price = quote.full_price + (quote.full_price * 20 / 100)
        expect(quote.price).to eq price
      end
    end

  end
end
