class Admin::ReviewsController < ApplicationController
    # before_action :authenticate_user!,  only: [:new, :create, :edit, :update, :destroy]
    # before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def new
  end

  def edit
  end

  def create
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_movie_path
  end

  def update
  end

  private
  def review_params
    params.require(:review).permit(:body, :user_id, :movie_id)
  end
end
