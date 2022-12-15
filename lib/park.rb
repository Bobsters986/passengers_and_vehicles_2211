class Park
  attr_reader :name,
              :admission,
              :vehicles,
              :charge

  def initialize(name, admission)
    @name = name
    @admission = admission
    @vehicles = []
    @revenue = 0
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def list_all_passengers
    @vehicles.map do |vehicle|
      vehicle.passengers
    end.flatten
  end
  
  def list_adult_passengers
    list_all_passengers.select do |passenger|
      passenger.adult? == true
    end
  end

  def charge
      @revenue += admission
  end

  def charge_adult_passengers
    list_adult_passengers.map do |adult|
      adult.charge
    end
  end

end