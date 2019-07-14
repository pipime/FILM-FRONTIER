class Admin::CastsController < ApplicationController
	before_action :authenticate_admin!, only: %i[new create index edit update destroy]
	
  def new
  end

  def edit
  end
end
