import mapboxgl from 'mapbox-gl';

import { initAddMarker, initRemoveMarker } from './init_toggle_markers';

const mapElement = document.getElementById('map');

const initFlyTo = map => {
  document.querySelectorAll('.venue-card').forEach(card => {
    card.addEventListener('click', event => {
      map.flyTo({
        center: [
          event.currentTarget.dataset.lng,
          event.currentTarget.dataset.lat
        ]
      });
    });
  });
};

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/light-v10',
    zoom: 7
  });
};

const addMarkersToMap = (map, markers, trip) => {
  markers.forEach(marker => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    if (trip) {
      new mapboxgl.Marker({ color: '#FE7763' })
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
    } else {
      let element = new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
      element._element.id = `marker-${marker.id}`;
      if (marker.active) element._element.classList.add('marker-active');
    }
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
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

    map.on('load', () => {
      initAddMarker();
      initRemoveMarker();
      initFlyTo(map);
      window.map = map;
    });
  }
};

export { initMapbox };
