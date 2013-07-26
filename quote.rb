class Quote

  attr_reader :pickup_postcode, :delivery_postcode, :vehicle

  VEHICLES_MARKUP = {bicycle: 10,
                     parcel_car: 20}

  def initialize(pickup_postcode, delivery_postcode, vehicle)
    @pickup_postcode = pickup_postcode
    @delivery_postcode = delivery_postcode
    @vehicle = vehicle.to_sym
  end

  def price
    if VEHICLES_MARKUP.include? vehicle
      full_price + markup
    else
      full_price
    end
  end

  def full_price
    ((pickup_postcode.to_i(36) - delivery_postcode.to_i(36)) / 1000).abs
  end

  def to_h
    h = {}
    [:pickup_postcode, :delivery_postcode, :price, :vehicle].each do |i|
      raise if send(i).nil?
      h[i] = send(i)
    end
    h
  end

  private

  def markup
    (full_price * VEHICLES_MARKUP[vehicle] / 100)
  end

end
