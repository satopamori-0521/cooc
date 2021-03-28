class ToppagesController < ApplicationController
  def index
      @recipes = Recipe.order(id: :desc).page(params[:page]).per(9)
  end
end
