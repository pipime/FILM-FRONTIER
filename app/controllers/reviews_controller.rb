class ReviewsController < ApplicationController

  before_action :authenticate_user!,  only: %i[create destroy]

  def new
  end

  def create
    movie = Movie.find(params[:movie_id])
	  # @review = movie.reviews.build(review_params)
	  review = Review.new(review_params)
	  review.movie_id = movie.id
	  review.user_id = current_user.id
	 if review.save
	  flash[:success] = "レビューしました"
	  redirect_back(fallback_location: movie_url(movie.id))
	 else
	  flash[:danger] = "レビューできません"
	  redirect_back(fallback_location: movie_url(movie.id))
	end
  end

  def edit
  end

  def update
  end

  def destroy
    movie = Movie.find(params[:movie_id])
    @review = current_user.reviews.find(params[:id])
    review.movie_id = movie.id
    review.destroy
    redirect_to movie_path(movie)
  end

  private
  def review_params
  	params.require(:review).permit(:body, :user_id, :movie_id)
  end
end
