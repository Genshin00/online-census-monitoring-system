class Vehicle < ApplicationRecord
  belongs_to :household

  enum vehicle_type: ["Car", "Wagon/Van Pick-up", "Truck/Bus", "Mini Bus", "Jeepney", "Owner Jeep", "Tricycle", "Motorcycle", "Others"]
end
