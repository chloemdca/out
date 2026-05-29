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

  # POST /lists/:id/toggle_venue?venue_id=4
  def toggle_venue
    @list = List.find(params[:id])
    @venue = Venue.find(params[:venue_id])
    @venue_list = ListVenue.find_by(list: @list, venue: @venue)
    if @venue_list.present?
      @venue_list.destroy
    else
      ListVenue.create(list: @list, venue: @venue)
    end
    redirect_back fallback_location: chats_path
  end

  private

  def list_venue_params
    params.require(:list_venue).permit(:venue_id)
  end
end
