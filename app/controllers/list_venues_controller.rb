class ListVenuesController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @list_venue = ListVenue.new(list_venue_params)
    @list_venue.list = @list

    if @list_venue.save
      redirect_to list_path(@list), notice: "Venue added to list"
    else
      redirect_to list_path(@list), alert: "Venue already in list"
    end
  end

  private

  def list_venue_params
    params.require(:list_venue).permit(:venue_id)
  end
end
