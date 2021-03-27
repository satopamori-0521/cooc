class RecipesController < ApplicationController
  before_action :require_user_logged_in
  
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
      redirect_to @recipe
    else
      flash.now[:danger] = "レシピ投稿に失敗しました"
      render :new
    end
  end


  def edit
  end

  def destroy
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:title, :image, :content, :materials, :method)
  end
end
