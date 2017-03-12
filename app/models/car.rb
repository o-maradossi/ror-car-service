class Car < ActiveRecord::Base
  belongs_to :dealership
  belongs_to :salesman
  belongs_to :customer
end
