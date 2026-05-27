class VenuesController < ApplicationController
  # GET /venues?category=Bar
  def index
    if params[:category]
      @venues = Venue.where(category: params[:category])
    else
      @venues = Venue.all
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @log = Log.new
  end
end
