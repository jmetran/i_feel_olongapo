class LocationsController < ApplicationController
  before_filter :find_location, :only => [:show, :edit, :update, :destroy]
  respond_to :html, :xml

  def index
    @locations =  Location.includes(:parent_location).page params[:page]
    respond_with(@locations)
  end

  def show
    respond_with(@location)
  end

  def edit; end

  def update
    if @location.update_attributes(params[:location])
      flash[:notice] = 'Location was successfully updated.'
    end
    respond_with(@location)
  end

  def destroy
    @location.destroy
    respond_with(@location)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      flash[:notice] = 'Location was successfully created.'
    end
    respond_with(@location)
  end

  protected

  def find_location
    @location = Location.find(params[:id])
  end

end
