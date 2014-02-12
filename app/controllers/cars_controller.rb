class CarsController < ApplicationController
  before_action :signed_in_user, only: [:new, :index, :edit, :create, :update, :destroy]
  before_action :admin_user, only: [:new, :index, :edit, :create, :update, :destroy]
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  layout 'user', only: [:index, :new, :edit]

  def inventory
    @cars = Car.all
    @bodyid = 'inventory'
  end

  def index
    @cars = Car.paginate(page: params[:page])
    @bodyid = 'car-index'
  end

  def show
    @cars = Car.without_car(@car).shuffle.pop(3)
    @previous = @car.previous
    @next = @car.next
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
    params.require(:car).permit(:make, :model, :year, :seats, :transmission, :drive, :interior, :exterior, uploads_attributes: [:upload, :id, :_destroy])
  end

end
