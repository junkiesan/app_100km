require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';

import { initAutocomplete } from '../plugins/init_autocomplete';

// document.addEventListener('turbolinks:load', () => {
  if (document.querySelector('#map')) initMapbox();
  if (document.querySelector('#trip_address')) initAutocomplete();


// });
