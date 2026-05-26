import { Controller } from "@hotwired/stimulus"

const PARIS_BOUNDS = [
  [2.2241, 48.8156], // southwest
  [2.4699, 48.9022]  // northeast
]

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    venues: Array
  }

  connect() {
    console.log("map connected");
    const token = document.querySelector("meta[name='mapbox-token']").getAttribute("content")
    mapboxgl.accessToken = token


    // using 'this' in order to attach the object to the controllers instance
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v11",
      center: [2.3514, 48.8575],
      zoom: 13,
      minZoom: 12,
      maxZoom: 18,
      maxBounds: PARIS_BOUNDS
    })

    // map needs to be ready for us to be able to add venue markers to it
    this.map.on("load" , () => {
      this.addMarkers()
      this.map.fitBounds(PARIS_BOUNDS, {
        padding: 40
      })
    })
  }

  // method to add the marker to the map
  addMarkers() {
  this.venuesValue.forEach((venue) => {
    const marker = new mapboxgl.Marker()
      .setLngLat([venue.lng, venue.lat])
      .addTo(this.map)

    marker.getElement().addEventListener("click", () => {
      this.selectVenue(venue)
    })
  })
  }

  selectVenue(venue) {
    // simplest option: redirect to venue page
    window.location.href = `/venues/${venue.id}`
  }
}
