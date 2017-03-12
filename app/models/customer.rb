class Customer < ActiveRecord::Base
  belongs_to :dealership
  belongs_to :salesman
  has_many :cars
end
