class ReviewsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  layout 'user'

  def index
    @reviews = Review.paginate(page: params[:page])
    @mainid = 'reviews'
  end

  def new
    @review = Review.new
    @mainid = 'new-review'
  end

  def edit
    @mainid = 'edit-review'
  end

  def create
    @review = Review.new(review_params)
    @mainid = 'new-review'

    if @review.save
      redirect_to reviews_path, notice: 'Review was successfully created'
    else
      render :new
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

  def show
  end

  def update
    if @review.update(review_params)
      redirect_to reviews_path, notice: 'Review was successfully updated'
    else
      redirect_to :edit
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:customer, :body, :car, :photo)
  end
end
