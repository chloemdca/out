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
    this.activePopup = null

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
      this.map.resize()
      this.addVenueSourceAndLayer()
      this.addVenueInteraction()
      this.map.fitBounds(PARIS_BOUNDS, { padding: 40 })
    })
  }

  // method to convert it into geoJson
  venuestoGEOJSON() {
    return {
      type: "FeatureCollection",
      features: this.venuesValue.map((venue) => ({
        type: "Feature",
        properties: {
          id: venue.id,
          name: venue.name,
          category: venue.category
        },
        geometry: {
          type: "Point",
          coordinates: [venue.lng, venue.lat]
        }
      }))
    }
  }

  // the map source and additional layers
  addVenueSourceAndLayer() {
    this.map.addSource("venues", {
      type: "geojson",
      data: this.venuestoGEOJSON()
    })
    this.map.addLayer({
      id: "venues",
      type: "circle",
      source: "venues",
      paint: {
        "circle-radius": 8,
        "circle-color": [
          "match",
          ["get", "category"],
          "cafe", "#3fdfff",
          "restaurant", "#fe6f2d",
          "bar", "#ff54bb",
          "#999999"
        ],
        "circle-stroke-width": 2,
        "circle-stroke-color": "#ffffff",
      }
    })
  }
  // pop up and cursor interaction feature
  addVenueInteraction() {
  this.map.on("click", (e) => {
    const features = this.map.queryRenderedFeatures(e.point, {
      layers: ["venues"]
    })

    if (!features.length) return

    const feature = features[0]
    const { id, name, category } = feature.properties
    const coordinates = feature.geometry.coordinates.slice()

    if (this.activePopup) {
      this.activePopup.remove()
    }

    this.map.flyTo({
      center: coordinates,
      zoom: 15
    })

    this.activePopup = new mapboxgl.Popup({ offset: 25 })
      .setLngLat(coordinates)
      .setHTML(`
        <div class="popup">
          <h3>${name}</h3>
          <p>${category}</p>
          <a href="/venues/${id}/logs/new" target="_blank" rel="noopener">
            Create a log
          </a>
        </div>
      `)
      .addTo(this.map)
  })

  this.map.on("mouseenter", "venues", () => {
    this.map.getCanvas().style.cursor = "pointer"
  })

  this.map.on("mouseleave", "venues", () => {
    this.map.getCanvas().style.cursor = ""
  })
  }
}
