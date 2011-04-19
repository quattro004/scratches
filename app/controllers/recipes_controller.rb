# Responsible for managing the lifeblood of this application, recipes.
class RecipesController < ApplicationController
  respond_to :html, :xml, :json
  attr_reader :all_categories
  before_filter :get_all_categories # Only get the list of categories once.
  attr_reader :current_category
  attr_reader :author_name
  load_and_authorize_resource

  def index
    if user_signed_in?
      @recipes = Recipe.public_or_user current_user
    else
      @recipes = Recipe.public_only
    end
    respond_with(@recipes)
  end

  def show
    get_current_category
    get_author_name
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
    @recipe.user_id = user_signed_in? ? current_user.id : 0
    @recipe.picture.delete_all if @recipe.picture.size > 0 && !@recipe.picture[0].data
    flash[:notice] = 'Recipe was successfully created.' if @recipe.save
    respond_with(@recipe)
  end

  def update
    @recipe.update_attributes(params[:recipe])
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

    def get_author_name 
      @author_name = (@recipe.user_id > 0) ? User.find { |user| user.id == @recipe.user_id }.name : 'Anonymous'
    end

    def setup_defaults
      @recipe.ingredient.build
      @recipe.picture.build
      @recipe.cook_time_in_minutes = 0
      @recipe.prep_time_in_minutes = 0
      @recipe.is_public = true
    end
end