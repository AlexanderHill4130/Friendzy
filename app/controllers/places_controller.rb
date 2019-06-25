require_relative "../services/foursquare_api.rb"

class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if params[:query].present?
      search_api("Milan",params[:query])

      sql_query = "name ILIKE :query OR category ILIKE :query OR address ILIKE :query"
      @places = Place.where(sql_query, query: "%#{params[:query]}%")
    else
      @places = Place.all
    end
  end

  def show
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to @place
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @place.update(place_params)
      redirect_to @place
    else
      render :edit
    end
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :category, :address, :rating, :photo)
  end
end
