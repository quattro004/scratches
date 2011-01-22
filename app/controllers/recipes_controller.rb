# Responsible for managing the lifeblood of this application, recipes.
class RecipesController < ApplicationController
  respond_to :html, :xml, :json
  attr_reader :all_categories
  before_filter :get_all_categories # Only get the list of categories once.
  attr_reader :current_category

  def index
    @recipes = Recipe.all
    respond_with(@recipes)
  end

  def show
    @recipe = Recipe.find(params[:id])
    get_current_category
    respond_with(@recipe)
  end

  def new
    @recipe = Recipe.new
    setup_defaults
    respond_with(@recipe)
  end

  def edit
    @recipe = Recipe.find(params[:id])
    respond_with(@recipe)
  end

  def create
    # TODO: Update recipe's author with current signed on user
    @recipe = Recipe.new(params[:recipe])
    flash[:notice] = 'Recipe was successfully created.' if @recipe.save
    respond_with(@recipe)
  end

  def update
    @recipe = Recipe.find(params[:id])
    flash[:notice] = 'Recipe was successfully updated.' if @recipe.update_attributes(params[:recipe])
    respond_with(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Successfully destroyed recipe.'
    respond_with(@recipe)
  end

  private

    def get_all_categories
      @all_categories = Category.all
    end

    def get_current_category
      @current_category = @all_categories.find { |category| category.id == @recipe.category_id }
    end

    def setup_defaults
      @recipe.ingredient.build
      @recipe.picture.build
      @recipe.cook_time_in_minutes = 0
      @recipe.prep_time_in_minutes = 0
    end
end