class SalesmenController < ApplicationController
  before_action :find_salesman, only: [:show, :edit, :update, :destroy]

  def index
    @salesmen = Salesman.all
  end

  def show
  end

  def new
    @salesman = Salesman.new(dealership_id: params[:dealership_id])
  end

  def create
    @salesman = Salesman.new(salesman_params)
    if @salesman.save
      redirect_to dealership_path(@salesman.dealership_id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @salesman.update(salesman_params)
      redirect_to salesman_path(@salesman)
    else
      render :edit
    end
  end

  def destroy
    if @salesman.destroy
      redirect_to salesmen_path
    else
      render :show
    end
  end

  private
  def salesman_params
    params.require(:salesman).permit(:first_name, :last_name, :age, :license_number, :dealership_id)
  end

  def find_salesman
    @salesman = Salesman.find(params[:id])
  end

end
