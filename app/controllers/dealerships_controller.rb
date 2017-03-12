class DealershipsController < ApplicationController
  before_action :find_dealership, only: [:show, :edit, :update, :destroy]

  def index
    @dealerships = Dealership.all
  end

  def show
    @cars = Car.where(dealership_id: params[:id])
    @salesmen = Salesman.where(dealership_id: params[:id])
  end

  def new
    @dealership = Dealership.new
  end

  def create
    @dealership = Dealership.new(dealership_params)
    if @dealership.save
      redirect_to dealerships_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dealership.update(dealership_params)
      redirect_to dealership_path(@dealership)
    else
      render :edit
    end
  end

  def destroy
    if @dealership.destroy
      redirect_to dealerships_path
    else
      render :show
    end
  end

  private
  def dealership_params
    params.require(:dealership).permit(:name, :address, :rating)
  end

  def find_dealership
    @dealership = Dealership.find(params[:id])
  end

end
