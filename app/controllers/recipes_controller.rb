class RecipesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit]
  
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
      @recipe = Recipe.new
  end

  def create
      @recipe = current_user.recipes.build(recipe_params)
      
      if @recipe.save
        flash[:success] = "レシピが正常に投稿されました"
        redirect_to root_url
      else
        flash.now[:danger] = "レシピ投稿に失敗しました"
        render :new
      end

  end
  
  def edit
     @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    
    if @recipe.update(recipe_params)
      flash[:success] = "正常に更新されました"
      redirect_to root_url
    else
      flash.now[:danger] = "更新されませんでした"
      render :edit
    end
  end


  def destroy
    @recipe.destroy
    flash[:success] = "レシピを削除しました"
    redirect_back(fallback_location: root_url)
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:title, :image, :content, :materials, :method)
  end
  
  
  def correct_user
    @recipe = current_user.recipes.find_by(id: params[:id])
    unless @recipe
      redirect_to root_url
    end
  end
end
