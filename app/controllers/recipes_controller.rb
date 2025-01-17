class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients.build
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.create(params_)
    redirect_to @recipe
  end

  private 

  def params_
    params.require(:recipe).permit(:title, ingredients_attributes:[:name, :quantity])
  end 
end
