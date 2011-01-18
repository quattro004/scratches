# Responsible for grouping recipes to aid in such things as searches.
class CategoriesController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @categories = Category.all
    respond_with(@categories)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
    @category = Category.find(params[:id])
    respond_with(@category)
  end

  def create
    @category = Category.new(params[:category])
    flash[:notice] = 'Category was successfully created.' if @category.save
    respond_with(@category, :location => categories_url)
  end
  
  def update
    @category = Category.find(params[:id])
    flash[:notice] = 'Category was successfully updated.' if @category.update_attributes(params[:category])
    respond_with(@category, :location => categories_url)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'Successfully destroyed category.'
    respond_with(@category)
  end
end
