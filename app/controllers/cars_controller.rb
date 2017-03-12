class CarsController < ApplicationController
  before_action :find_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.where(dealership_id: params[:dealership_id])
  end

  def show
  end

  def new
    @car = Car.new(dealership_id: params[:dealership_id])
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to dealership_path(@car.dealership_id)
    else
      alert('error')
      render :new
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to car_path(@car)
    else
      render :edit
    end
  end

  def destroy
    if @car.destroy
      redirect_to dealership_path(@car.dealership_id)
    else
      render :show
    end
  end

  private
  def car_params
    params.require(:car).permit(:make, :model, :year, :color, :mileage, :dealership_id, :salesman_id)
  end

  def find_car
    @car = Car.find(params[:id])
  end
end
