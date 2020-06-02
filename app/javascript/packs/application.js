require('@rails/ujs').start();
require('@rails/activestorage').start();
require('channels');

import 'bootstrap';
// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';
import { initMapboxShow } from '../plugins/init_mapbox_show';
import '../plugins/flatpickr';

import { initMarkerHightlight } from '../plugins/marker_highlight';
// Star Rating for reviews
import { initStarRating } from '../plugins/init_star_rating';

import { initChatroomCable } from '../channels/chatroom_channel.js';

import { initAutocomplete } from '../plugins/init_autocomplete';

import { initFilter } from '../plugins/init_filter';

// document.addEventListener('turbolinks:load', () => {
  if (document.querySelector('#map')) initMapbox();
  if (document.querySelector('#map-show')) initMapboxShow();
  // const map = initMapbox();

  if (document.querySelector('#trip_address')) initAutocomplete();

initStarRating();
initChatroomCable();
initFilter();

// initMarkerHightlight(map);

// });
