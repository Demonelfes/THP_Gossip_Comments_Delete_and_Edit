class CityController < ApplicationController
  def index
    @all_cities = City.all
  end

  def show
    @city = City.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
