class Admin::MoviesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def new
  end

  def show
  end

  def index
  end

  def search
  end

  def edit
  end

  def destoy
  end
end
