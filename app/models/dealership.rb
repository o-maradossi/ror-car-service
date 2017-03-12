class Dealership < ActiveRecord::Base
  has_many :cars
  has_many :salesmen
  has_many :customers
end
