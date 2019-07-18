class Admin::GenresController < ApplicationController

	before_action :authenticate_admin!, only: %i[new create index edit update destroy]

  def index
  	@genre =Genre.all
  end

  def new
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  	  flash[:notice] = "ジャンル名: " + @genre.genre + "を追加しました"
  	  redirect_to new_admin_genre_path
  	else
  	  flash[:notice] = "ジャンル追加に失敗しました"
  	  redirect_to new_admin_genre_path
  	end
  end

  def edit
    @genre = Genre.find(params[:id])
    @movie = Movie.find(params[:movie_id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンル名: " + @genre.genre + "に編集しました"
      redirect_to edit_admin_movie_path(params[:genre][:movie_id])
    else
      flash[:notice] = "ジャンル編集に失敗しました"
      render :edit
    end
  end

  def destroy
  end

  private
  def genre_params
  	params.require(:genre).permit(:genre)
  end
end