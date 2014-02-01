class CarsController < ApplicationController
  # before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
    @bodyid = 'inventory'
  end

  def show
    @bodyid = 'car-details'
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
  end

  def destroy
  end

  private

  # find by named routes parameter
  def set_car
    @car = Car.find(params[:id])
  end
end
