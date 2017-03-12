class Salesman < ActiveRecord::Base
  has_many :cars
  has_many :customers
  belongs_to :dealership
end
