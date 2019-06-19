class PlacesController < ApplicationController

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR category ILIKE :query OR address ILIKE :query"
      @places = Place.where(sql_query, query: "%#{params[:query]}%")
    else
      @places = Place.all
    end
  end
end
