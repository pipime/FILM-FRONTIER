class Admin::CastsController < ApplicationController

	before_action :authenticate_admin!, only: %i[new create index edit update destroy]

  def index
  	@casts = Cast.all
  end

  def new
  	@cast = Cast.new
  	@casts = Cast.all
  end

  def create
  	@cast = Cast.new(cast_params)
  	if @cast.save
  	  flash[:notice] = "出演者名: " + @cast.cast + "を追加しました"
  	  redirect_to new_admin_movie_path
  	else
  	  flash[:notice] = "出演者追加に失敗しました"
  	  redirect_to new_admin_cast_path
  	end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private
  def cast_params
  	params.require(:cast).permit(:cast)
  end
end