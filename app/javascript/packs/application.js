require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("jquery")
// require("popper")
require("bootstrap")
require("chartkick")
require("chart.js")
require("moment-js")
require("bootstrap-daterangepicker")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
window.jQuery = $;
window.$ = $;


$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
