'use strict';
const mapboxgl = require('mapbox-gl');
const insertCss = require('insert-css');
const fs = require('fs');
mapboxgl.accessToken = window.localStorage.getItem('MapboxAccessToken');

// const directionsDiv = document.body.appendChild(document.createElement('div'));
// directionsDiv.id = 'directions';

insertCss(fs.readFileSync('./src/mapbox-gl-directions.css', 'utf8'));
insertCss(fs.readFileSync('./node_modules/mapbox-gl/dist/mapbox-gl.css', 'utf8'));
const mapDiv = document.body.appendChild(document.createElement('div'));
mapDiv.style = 'position:absolute;top:0;right:0;left:0;bottom:0;';

const map = window.map = new mapboxgl.Map({
  hash: true,
  container: mapDiv,
  style: 'mapbox://styles/mapbox/streets-v9',
  center: [-79.4512, 43.6568],
  zoom: 13
});

// remove control
const button = document.body.appendChild(document.createElement('button'));
button.style = 'z-index:10;position:absolute;top:10px;right:10px;';
button.textContent = 'Remove directions control';

// remove all waypoints
const removeWaypointsButton = document.body.appendChild(document.createElement('button'));
removeWaypointsButton.style = 'z-index:10;position:absolute;top:30px;right:10px;';
removeWaypointsButton.textContent = 'Remove all waypoints';

// directions
const MapboxDirections = require('../src/index');
const directions = new MapboxDirections({
  accessToken: window.localStorage.getItem('MapboxAccessToken'),
  unit: 'metric',
  profile: 'mapbox/cycling'
});
window.directions = directions;

map.addControl(directions, 'top-left');

map.on('load', () => {
  button.addEventListener('click', function() {
    map.removeControl(directions);
  });

  removeWaypointsButton.addEventListener('click', function() {
    directions.removeRoutes();
  });
});
