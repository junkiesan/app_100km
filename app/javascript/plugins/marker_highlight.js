const highlightCard = (event, map) => {
  const card = event.currentTarget;
  card.classList.toggle("card-highlight");
  const id = card.dataset.id;
  const marker = document.querySelector(`#marker-${id}`);
  marker.classList.toggle("marker-highlight");
  const mapElement = document.getElementById('map');
  const venue_markers = JSON.parse(mapElement.dataset.venueMarkers);
  const venue_marker = venue_markers.find((marker) => {
    return parseInt(marker.marker_id) === parseInt(id);
  });
  map.flyTo({center: [venue_marker.lng, venue_marker.lat]});
};

const addListenerToVenuesCards = (map) => {
  const allCards = document.querySelectorAll('.venue-card');
  allCards.forEach((card) => {
    card.classList.remove("card-highlight");
    card.addEventListener('click', (event) => {
      highlightCard(event, map)
    });
  });
};

const initMarkerHightlight = (map) => {
  const customView = document.querySelector('#custom-view');
  if (customView) {
    addListenerToVenuesCards(map);
  };
};

export { initMarkerHightlight };
