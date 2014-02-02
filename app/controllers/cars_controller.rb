class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
    @bodyid = 'inventory'
  end

  def show
    @bodyid = 'car-details'
  end

  def new
    @car = Car.new
    @bodyid = 'new-car'
  end

  def edit
    @bodyid = 'edit-car'
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car, notice: 'Car was successfully created'
    else
      render :new
    end
  end


  def destroy
    @car.destroy
    redirect_to inventory_path
  end

  private

  # find by named routes parameter
  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :seats, :transmission, :drive, :interior, :exterior)
  end
end
