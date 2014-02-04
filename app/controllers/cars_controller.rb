class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
    @bodyid = 'inventory'
  end

  def show
    @cars = Car.without_car(@car).shuffle[0...3]
    @previous = @car.id == 1 ? Car.last : Car.find( @car.id - 1 )
    @next = @car == Car.last ? Car.first : Car.find( @car.id + 1 )
    @uploads = @car.uploads
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

  def update
    if @car.update(car_params)
      redirect_to @car, notice: 'Car was successfully updated'
    else
      redirect_to :edit
    end
  end

  def destroy
    @car.destroy
    @car.uploads.each do |upload|
      upload.destroy
    end
    redirect_to inventory_path
  end

  private

  # find by named routes parameter
  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :seats, :transmission, :drive, :interior, :exterior, uploads_attributes: [:upload])
  end
end
