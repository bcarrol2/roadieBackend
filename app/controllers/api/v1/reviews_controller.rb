class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    reviews = Review.all.order(created_at: :desc)
    reviews_count = reviews.count
    average_reviews5 = reviews.where(rating: 5).count
    average_reviews4 = reviews.where(rating: 4).count
    average_reviews3 = reviews.where(rating: 3).count
    average_reviews2 = reviews.where(rating: 2).count
    average_reviews1 = reviews.where(rating: 1).count
    average_rating5 = reviews.where(rating: 5)
    average_rating4 = reviews.where(rating: 4)
    average_rating3 = reviews.where(rating: 3)
    average_rating2 = reviews.where(rating: 2)
    average_rating1 = reviews.where(rating: 1)
    average_reviews = reviews.map { |r| r.rating }.sum / reviews.count
    review_data = {
      counted_reviews: reviews_count,
      average_star_rating: average_reviews,
      rev5: average_reviews5,
      rev4: average_reviews4,
      rev3: average_reviews3,
      rev2: average_reviews2,
      rev1: average_reviews1,
      rating5: average_rating5,
      rating4: average_rating4,
      rating3: average_rating3,
      rating2: average_rating2,
      rating1: average_rating1,
    }
    render json: review_data
  end

  def reviews_feed
    review = Review.all.order(created_at: :desc)
    render json: review
  end

  def create
    review = Review.create!(review_params)
    if review
      render json: review
    else
      render json: review.errors
    end
  end

  def show
    if review
      render json: review
    else
      render json: review.errors
    end
  end

  def destroy
    review&.destroy
    render json: { message: 'Review deleted!' }
  end

  private

  def review_params
    params.require(:review).permit(:rating, :name, :title, :review_text)
  end

  def review
    @review ||= Review.find(params[:id])
  end
end
