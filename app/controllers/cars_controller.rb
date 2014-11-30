class CarsController < ApplicationController
  before_action :signed_in_user, except: [:show, :inventory]
  before_action :admin_user, except: [:show, :inventory]
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :set_message, only: [:inventory, :show, :create]
  layout 'user', only: [:index, :new, :edit, :create]

  def inventory
    @cars = Car.all
    @body_id = 'inventory'
  end

  def index
    @cars = Car.paginate(page: params[:page])
    @mainid = 'car-index'
  end

  def show
    @cars = Car.without_car_shuffle(@car, 3)
    @previous = @car.previous
    @next = @car.next
    @uploads = @car.uploads
    @body_id = 'car-details'
  end

  def new
    @car = Car.new
    @mainid = 'new-car'
  end

  def edit
    @mainid = 'edit-car'
  end

  def create
    @car = Car.new(car_params)
    @mainid = 'new-car'

    if @car.save
      redirect_to cars_path, notice: 'Car was successfully created'
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
    params.require(:car).permit(:make, :model, :year, :seats, :transmission, :drive, :interior, :exterior, uploads_attributes: [:upload, :id, :_destroy])
  end
end
