# Responsible for managing the lifeblood of this application, recipes.
class RecipesController < ApplicationController
  respond_to :html, :xml, :json
  attr_reader :all_categories
  before_filter :get_all_categories # Only get the list of categories once.
  attr_reader :current_category
  load_and_authorize_resource

  def index
    @recipes = Recipe.public
    respond_with(@recipes)
  end

  def show
    get_current_category
    respond_with(@recipe)
  end

  def new
    setup_defaults
    respond_with(@recipe)
  end

  def edit
    respond_with(@recipe)
  end

  def create
    # TODO: Update recipe's author with current signed on user
    flash[:notice] = 'Recipe was successfully created.' if @recipe.save
    respond_with(@recipe)
  end

  def update
    flash[:notice] = 'Recipe was successfully updated.' if @recipe.update_attributes(params[:recipe])
    respond_with(@recipe)
  end

  def destroy
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
      @recipe.is_public = true
    end
end