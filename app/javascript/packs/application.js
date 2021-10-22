// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'bootstrap';
// import { loadDynamicBannerText } from '../components/banner';
import AOS from 'aos';
import { initTyped } from './plugins/init_typedjs';
import { initSelect2 } from './plugins/init_select2';
import { initStarRating } from './plugins/init_star_rating';

document.addEventListener('turbolinks:load', () => {
    // Call your JS functions here
    // [...]
    initSelect2();
    initTyped();
    AOS.init();
    initStarRating();
    // loadDynamicBannerText();
  });
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
