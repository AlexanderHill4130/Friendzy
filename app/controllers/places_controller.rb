require_relative "../services/foursquare_api.rb"

class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index

    if params[:query].present?
      search_api("Milan",params[:query])

      sql_query = "name ILIKE :query OR category ILIKE :query OR address ILIKE :query"
      @places = Place.where(sql_query, query: "%#{params[:query]}%")
    else
      @places = Place.all
    end
  end
end
