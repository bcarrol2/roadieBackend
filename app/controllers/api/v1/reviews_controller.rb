class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    reviews = Review.all.order(created_at: :desc)
    all_reviews_rated5 = reviews.where(rating: 5)
    all_reviews_rated4 = reviews.where(rating: 4)
    all_reviews_rated3 = reviews.where(rating: 3)
    all_reviews_rated2 = reviews.where(rating: 2)
    all_reviews_rated1 = reviews.where(rating: 1)
    average_reviews = reviews.map { |r| r.rating }.sum / reviews.count
    review_data = {
      counted_reviews: reviews.count,
      average_star_rating: average_reviews,
      rated5_count: all_reviews_rated5.count,
      rated4_count: all_reviews_rated4.count,
      rated3_count: all_reviews_rated3.count,
      rated2_count: all_reviews_rated2.count,
      rated1_count: all_reviews_rated1.count,
      rating5: all_reviews_rated5,
      rating4: all_reviews_rated4,
      rating3: all_reviews_rated3,
      rating2: all_reviews_rated2,
      rating1: all_reviews_rated1,
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
