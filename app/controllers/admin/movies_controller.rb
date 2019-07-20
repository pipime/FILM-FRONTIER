class Admin::MoviesController < ApplicationController
    before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def index
    @movies = Movie.all
    @movies = Movie.page(params[:page]).reverse_order
  end

  def search
    @movies = Movie.search(params[:search])
    render :search
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "映画:" + @movie.title + "を追加しました"
      redirect_to admin_movies_path
    else
      flash[:notice] = "映画追加に失敗しました"
      redirect_to new_admin_movie_path
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:notice] = "映画: " + @movie.title + "を編集しました"
      redirect_to admin_movie_path(@movie)
    else
      flash[:notice] = "映画編集に失敗しました"
      redirect_to edit_admin_movie_path(@movie)
    end
  end

  def destoy
  end

  def search
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :summary, :jacket_image, :cast_id, :year_id, :genre_id)
  end
end