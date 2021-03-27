class ToppagesController < ApplicationController
  def index
    if logged_in?
      @recipes = current_user.recipes.order(id: :desc).page(params[:page])
    end
  end
end
