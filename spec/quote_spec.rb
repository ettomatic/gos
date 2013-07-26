require 'spec_helper'

describe "Quote" do

  describe "price calculation" do

    it "produces positive prices" do
      quote = Quote.new('1111 111','ZZZ ZZZ')
      expect(quote.price).to be > 0
    end

  end
end
