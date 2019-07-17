class Admin::MoviesController < ApplicationController
    before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def index
    @movie = Movie.all
    @movie = Movie.page(params[:page]).reverse_order
  end

  def search
    @movie = Movie.search(params[:search])
    render :search
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "映画名: " + @movie.title + "を追加しました"
      redirect_to admin_movies_path
    else
      flash[:notice] = "映画追加に失敗しました"
      redirect_to new_admin_movie_path
    end
  end

  def edit
  end

  def destoy
  end

  private
  def item_params
    params.require(:movie).permit(:title, :summary, :jacket_image, :cast_id, :year_id, :genre_id)
  end
end