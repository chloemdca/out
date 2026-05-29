class FindNearbyVenuesTool < RubyLLM::Tool
  desc "Find nearby venues from the database"

  param :location,
        type: :string,
        desc: "The place or area to search near, such as Melbourne Central"

  param :category,
        type: :string,
        required: false,
        desc: "Type of venue such as cafe, restaurant, or bar"

  def execute(location:, category: nil)
    Rails.logger.info("TOOL EXECUTING")

    results = Geocoder.search(location)

    return { venues: [] } if results.empty?

    coordinates = results.first.coordinates

    venues = Venue.near(coordinates, 5)

    venues = venues.where(category: category&.downcase) if category.present?

    {
      venues: venues.limit(5).map do |venue|
        {
          id: venue.id,
          name: venue.name,
          category: venue.category,
          distance: venue.distance.round(2),
          lat: venue.lat,
          lng: venue.lng
        }
      end
    }
  end
end
