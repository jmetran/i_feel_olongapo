class BusinessesController < ApplicationController

  before_filter :find_business, :only => [:show, :edit, :update, :destroy]
  respond_to :html, :xml

  def index
    @businesses =  Business.search(params)
    respond_with(@businesses)
  end

  def show
    respond_with(@businesses)
  end

  def edit; end

  def update
    if @business.update_attributes(params[:business])
      flash[:notice] = 'Business was successfully updated.'
    end
    respond_with(@business)
  end

  def destroy
    @business.destroy
    respond_with(@business)
  end

  def new
    @business = Business.new
  end

  def create
    @business = current_user.businesses.new(params[:business])
    if @business.save
      flash[:notice] = 'Business was successfully created.'
    end
    respond_with(@business)
  end

  protected

  def find_business
    @business = Business.find(params[:id])
  end

end
