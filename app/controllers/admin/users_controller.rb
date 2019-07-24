class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!, only: [:show, :edit, :update, :destroy, :index]

  def index
    @users = User.all
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
     flash[:notice] = "編集しました"
     redirect_to admin_user_path(user)
    else
     flash[:notice] = "編集に失敗しました"
     redirect_to edit_admin_user_path(user)
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_user_path(user)
  end


  def search
    @users = User.search(params[:search])
    @users_page = User.page(params[:page]).reverse_order
    render :search
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end
end