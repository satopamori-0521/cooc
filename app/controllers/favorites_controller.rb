class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.favorite(recipe)
    flash[:success] = "お気に入り登録しました"
    redirect_to user_path(id: current_user)
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    current_user.unfavorite(recipe)
    flash[:success] = "お気に入り登録を解除しました"
    redirect_to user_path(id: current_user)
  end
end
