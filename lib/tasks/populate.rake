namespace :populate do
  desc "Populates database with 10 dealerships"
  task dealerships: :environment do
    Dealership.populate(10) do |dealership|
      dealership.name = Faker::Company.name
      dealership.address = Faker::Address.street_address 
    end
    puts "10 Dealerships created"
  end

  desc "Populates database with 10 salesmen"
  task salesmen: :environment do
    Salesman.populate(10) do |salesman|
      salesman.first_name = Faker::Name.first_name
      salesman.last_name = Faker::Name.last_name
      salesman.age = Faker::Number.between(20, 80)
      salesman.dealership_id = [1, Dealership.count]
    end
    puts "10 Salesmen created"
  end

  desc "Populates database with 10 caras"
  task cars: :environment do
    Car.populate(10) do |car|
      car.make = ['Toyota', 'Ford', 'Ferrari']
      car.model = ['Prius', 'Ram', 'PitViper']
      car.year = Faker::Number.between(1950, 2016)
      car.color = Faker::Color.color_name
      car.dealership_id = [1, Dealership.count]
    end
    puts "10 Cars created"
  end

  desc "Populates database with 10 customers"
  task customers: :environment do
    Customer.populate(10) do |customer|
      customer.first_name = Faker::Name.first_name
      customer.last_name = Faker::Name.last_name
      customer.age = Faker::Number.between(20, 80)
      customer.budget = Faker::Number.between(20, 100000)
      customer.dealership_id = [1, Dealership.count]
    end
    puts "10 customers created"
  end
end
