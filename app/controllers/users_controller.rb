class UsersController < ApplicationController

  before_action :authenticate_user!,  only: [:show, :edit, :update, :resign, :destroy]
  before_action :authenticate_admin!, only: [:show, :edit, :update, :destroy, :index]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集しました"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "編集に失敗しました"
      redirect_to edit_user_path(current_user)
  end

  def resign
    @user = current_user
  end

  def destroy
    user = current_user
    user.destroy
    redirect_to root_path
  end

  def index
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end
end
