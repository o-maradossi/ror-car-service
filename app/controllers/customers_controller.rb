class CustomersController < ApplicationController
  before_action :find_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to dealership_path(@customer.dealership_id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to dealership_path(@customer.dealership_id)
    else
      render :edit
    end
  end

  def destroy
    if @customer.destroy
      redirect_to dealership_path(@customer.dealership_id)
    else
      render :show
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :age, :budget, :dealership_id, :salesman_id)
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end
end
