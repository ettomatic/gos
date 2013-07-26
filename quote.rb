class Quote

  attr_reader :pickup_postcode, :delivery_postcode

  def initialize(pickup_postcode, delivery_postcode)
    @pickup_postcode = pickup_postcode
    @delivery_postcode = delivery_postcode
  end

  def price
    679
  end

  def to_h
    h = {}
    [:pickup_postcode, :delivery_postcode, :price].each do |i|
      raise_exception if send(i).nil?
      h[i] = send(i)
    end
    h
  end

end
