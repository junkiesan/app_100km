import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/light-v10',
    zoom: 7

  });
};

const addMarkersToMap = (map, markers, trip) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    if (trip) {
    new mapboxgl.Marker({color: "#FE7763"})
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map)
    } else {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map)
    }
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.tripMarker);
    addMarkersToMap(map, markers, true);
    fitMapToMarkers(map, markers);
    const venue_markers = JSON.parse(mapElement.dataset.venueMarkers);
    addMarkersToMap(map, venue_markers, false);
    fitMapToMarkers(map, venue_markers);
  }
};

export { initMapbox };
