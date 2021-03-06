// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import '../stylesheets/application'
import 'materialize-css/dist/js/materialize'

document.addEventListener('DOMContentLoaded', function() {
  document.addEventListener('turbolinks:load', function () {
    var options = {};
    var elems = document.querySelectorAll('.sidenav');
    M.Sidenav.init(elems, options);
    var elems = document.querySelectorAll('.sidenav-left');
    M.Sidenav.init(elems, {
      edge: 'left',
      preventScrolling: false
    });
    var elems = document.querySelectorAll('.sidenav-right');
    M.Sidenav.init(elems, {edge: 'right'});
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems, options);
    var elems = document.querySelectorAll('.materialboxed');
    var instances = M.Materialbox.init(elems, options);
    var elems = document.querySelectorAll('.collapsible');
    var instances = M.Collapsible.init(elems, options);
  });
});
