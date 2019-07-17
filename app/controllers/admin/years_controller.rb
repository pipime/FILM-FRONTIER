class Admin::YearsController < ApplicationController

	before_action :authenticate_admin!, only: %i[new create index edit update destroy]

  def index
  	@year = Year.all
  end

  def new
  	@year = Year.new
  	@years = Year.all
  end

  def create
  	@year = Year.new(year_params)
  	if @year.save
  	   flash[:notice] = "制作年: " + @year.year + "を追加しました"
  	   redirect_to new_admin_movie_path
  	else
  	   flash[:notice] = "制作年追加に失敗しました"
  	   redirect_to new_admin_year_path
  	end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def year_params
  	params.require(:year).permit(:year)
  end
end