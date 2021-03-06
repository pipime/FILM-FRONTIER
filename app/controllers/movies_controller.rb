class MoviesController < ApplicationController

  def index
    # @movies = Movie.all
    # @search_movies = Movie.page(params[:page]).reverse_order
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new
    @search = Movie.ransack(params[:q])
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to movies_path
  end

  def edit
  end

  def update
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :summary, :jacket_image, :cast_id, :year_id, :genre_id,
      reviews_attributes: [:id, :body, :movie_id, :user_id])
  end
end
