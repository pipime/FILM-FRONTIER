class ApplicationController < ActionController::Base
  before_action :set_search
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user
      root_path
    elsif current_admin
      admin_movies_path
    end
  end

  def after_sign_up_path_for(resource)
    if current_user
      root_path
    elsif current_admin
      admin_movies_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def set_search
    @search = Movie.ransack(params[:q])
    @search_movies = @search.result.page(params[:page]).reverse_order
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
