class VenuesController < ApplicationController
  # GET /venues?category=Bar
  def index
    @venues = Venue.all

    if params[:category].present?
      @venues = Venue.where(category: params[:category])
    end

    case params[:sort]
    when "az"
      @venues = @venues.order(:name)
    when "za"
      @venues = @venues.order(name: :desc)
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @log = Log.new
  end
end
