require './lib/passenger'
require './lib/vehicle'
require './lib/park'

RSpec.describe Park do
  let(:park) { Park.new("Yosemite", 20) }
  let(:sedan) { Vehicle.new("2001", "Honda", "Civic") }
  let(:truck) { Vehicle.new("2004", "Toyota", "Tacoma") }
  let(:charlie) { Passenger.new({"name" => "Charlie", "age" => 18}) }
  let(:taylor) { Passenger.new({"name" => "Taylor", "age" => 12}) }
  let(:jude) { Passenger.new({"name" => "Jude", "age" => 20}) }
  let(:mary) { Passenger.new({"name" => "Mary", "age" => 10}) }


  describe 'Iteration 3' do
    it "exists" do
      expect(park).to be_an_instance_of(Park)
    end

    it "has attributes" do
      expect(park.name).to eq("Yosemite")
      expect(park.admission).to eq(20)
      expect(park.vehicles).to eq([])
    end

    it "can add and list all vehicles in park" do
      park.add_vehicle(sedan)
      park.add_vehicle(truck)

      expect(park.list_all_vehicles).to eq([sedan, truck])
    end

    it "can list all passengers in park" do
      sedan.add_passenger(charlie)
      sedan.add_passenger(taylor)
      truck.add_passenger(jude)
      truck.add_passenger(mary)

      park.add_vehicle(sedan)
      park.add_vehicle(truck)

      expect(park.list_all_passengers).to eq([charlie, taylor, jude, mary])
    end 
    
    it "can calculate revenue" do
      sedan.add_passenger(charlie)
      sedan.add_passenger(taylor)
      truck.add_passenger(jude)
      truck.add_passenger(mary)

      park.add_vehicle(sedan)
      park.add_vehicle(truck)

      expect(park.list_adult_passengers).to eq([charlie, jude])

      park.charge_adults
      expect(park.revenue).to eq(40)
    end
    
  end
end