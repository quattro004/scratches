# Responsible for grouping recipes to aid in such things as searches.
class CategoriesController < ApplicationController
  respond_to :html, :xml, :json
  load_and_authorize_resource
  
  def index
    @categories = Category.all
    respond_with(@categories)
  end

  def new
    respond_with(@category)
  end

  def edit
    respond_with(@category)
  end

  def create
    flash[:notice] = 'Category was successfully created.' if @category.save
    respond_with(@category, :location => categories_url)
  end
  
  def update
    flash[:notice] = 'Category was successfully updated.' if @category.update_attributes(params[:category])
    respond_with(@category, :location => categories_url)
  end

  def destroy
    @category.destroy
    flash[:notice] = 'Successfully destroyed category.'
    respond_with(@category)
  end
end
