import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map-show');

const buildMap = (marker) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map-show',
    style: 'mapbox://styles/mapbox/light-v10',
    zoom: 7,
    center: [marker[0].lng, marker[0].lat]
  });
};

const addMarkersToMap = (map, markers, trip) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    if (trip) {
      const el = document.createElement('div');
      el.className = 'marker';
      el.style.backgroundImage = `url('${marker.image_url}')`;
      el.style.backgroundSize = 'contain';
      el.style.width = '45px';
      el.style.height = '45px';
      let element = new mapboxgl.Marker(el)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
      element._element.id = `marker-home`;
    } else {
    new mapboxgl.Marker({color: "#00a295"})
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

function displayTrip(map, markers) {
    map.addLayer({
        "id": "journey", //identifiant unique de l'objet
        "type": "line",
        "source": {
            "type": "geojson",
            "data": {
                "type": "Feature",
                "properties": {},
                "geometry": {
                    "type": "LineString",
                    "coordinates": markers
                }
            }
        },
        "paint": {
            "line-color": "#FE7763", //couleur de la ligne
            "line-width": 3 //epaisseur de la ligne
        }
    });
}

function displayTripReshaped(map, coords) {
    //on transforme nos coordonées en string pour l'appel de l'API
    var coordsString = coords.join(';');
    //choix du type d'itinéraire que l'on souhaite calculer (par exemple avec "walking" on ne fera pas le tour d'un rond point, avec "driving" si.
    var typeRoute = 'driving'; //cycling, walking, driving-traffic
    var directionsRequest = 'https://api.mapbox.com/directions/v5/mapbox/'+typeRoute+'/' + coordsString + '?geometries=geojson&access_token=' + mapElement.dataset.mapboxApiKey;
    console.log(directionsRequest);
    var xhr = new XMLHttpRequest();
    xhr.open('GET', directionsRequest);
    xhr.onload = function () {
        if (xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            //on récupère la données calculé qui nous permettra d'afficher l'itinéraire
            var route = response["routes"][0]["geometry"];
            //add layer
            map.addLayer({
                id: 'journeyReshaped', //identifiant unique de l'objet
                type: 'line',
                source: {
                    type: 'geojson',
                    data: {
                        type: 'Feature',
                        geometry: route //utilisation de l'itinéraire
                    }
                },
                paint: {
                    'line-color': "#FE7763", //couleur de la ligne
                    'line-width': 7, //epaisseur de la ligne
                    'line-opacity': 0.5 //opacité de la ligne
                }
            });
        } else {
            //en cas d'erreur ajax
            console.log('Request failed.  Returned status of ' + xhr.status);
        }
    };
    xhr.send();
}

const initMapboxShow = () => {
  if (mapElement) {
    const map = buildMap(JSON.parse(mapElement.dataset.tripMarker));
    const markers = JSON.parse(mapElement.dataset.tripMarker);
    map.on("load", function(){
      addMarkersToMap(map, markers, true);
      // fitMapToMarkers(map, markers);
      const venue_markers = JSON.parse(mapElement.dataset.venueMarkers);
      addMarkersToMap(map, venue_markers, false);
      // fitMapToMarkers(map, venue_markers);
      const steps = [];
      steps.push([markers[0].lng, markers[0].lat]);
      venue_markers.forEach((marker) => {
        steps.push([marker.lng, marker.lat])
      });
      // displayTrip(map, steps);
      if (mapElement.dataset.itinerary) {
        displayTripReshaped(map, steps);
      }
    });
  }
};

export { initMapboxShow };
