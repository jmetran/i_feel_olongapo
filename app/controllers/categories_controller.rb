class CategoriesController < ApplicationController
  before_filter :find_category, :only => [:show, :edit, :update, :destroy]
  respond_to :html, :xml

  def index
    @categories =  Category.page params[:page]
    respond_with(@categories)
  end

  def show
    respond_with(@category)
  end

  def edit; end

  def update
    if @category.update_attributes(params[:category])
      flash[:notice] = 'Category was successfully updated.'
    end
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = 'Category was successfully created.'
    end
    respond_with(@category)
  end

  protected

  def find_category
    @category = Category.find(params[:id])
  end

end
