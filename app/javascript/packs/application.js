import 'bootstrap';
import "@fortawesome/fontawesome-free/css/all"
import { initChatroomCable } from "../channels/chatroom_channel.js"
import { initNotificationCable } from '../channels/notification_channel.js';
import { setupGooglePlaces } from "../components/google_places.js"

// When using a bundler such as Webpack,
// include both noUiSlider and its stylesheet:


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
document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  const jsLogin = document.getElementById('js-login').dataset.id
  if (jsLogin == 1 ) {
    initChatroomCable();
    initNotificationCable();
    setupGooglePlaces();
  }
  else {
    setupGooglePlaces();
  }
});



// image js

$(".imgAdd").click(function(){
  $(this).closest(".row").find('.imgAdd').before('<div class="col-sm-2 imgUp m-4"><div class="imagePreview"></div><label class="btn btn-primary-photo">Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;"></label><i class="fa fa-times del"></i></div>');
});
$(document).on("click", "i.del" , function() {
  $(this).parent().remove();
});
$(function() {
    $(document).on("change",".uploadFile", function()
    {
        var uploadFile = $(this);
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

        if (/^image/.test( files[0].type)){ // only image file
            var reader = new FileReader(); // instance of the FileReader
            reader.readAsDataURL(files[0]); // read the local file

            reader.onloadend = function(){ // set image data as background of div
                //alert(uploadFile.closest(".upimage").find('.imagePreview').length);
uploadFile.closest(".imgUp").find('.imagePreview').css("background-image", "url("+this.result+")");
            }
        }

    });
});

