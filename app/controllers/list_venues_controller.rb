class ListVenuesController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @venue = Venue.find(params[:venue_id])
    @list_venue = @list.list_venues.new(venue_id: params[:venue_id])

    if @list_venue.save
      redirect_to list_path(@list), notice: "Venue added to list"
    else
      redirect_to list_path(@list), alert: "Venue already in list"
    end
  end
end
