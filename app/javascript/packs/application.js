require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("jquery")
require("bootstrap")
require("chartkick")
require("chart.js")
require("moment-js")
require("select2")
require("aos")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
window.jQuery = $;
window.$ = $;

$('.alert').alert();

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});

var search_query = function(){
  $(document).ready(function(){
    $('#search_query').select2({
      ajax: {
        url: "<%= patients_path(format: 'json') %>",
        dataType: "json",
        delay: 250,
        data: function (params) {
          var queryParameters = {
            q: params.term
          }
          return queryParameters;
        },
        processResults: function (data) {
          // Transforms the top-level key of the response object from 'items' to 'results'
          return {
            results: $.map( data, function(patient, i) {
              return { id: patient.fiscalcode, text: patient.name }
            })
          };
        },
      }
        // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
    });
  });
}
