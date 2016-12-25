$(document).ready(function() {
    Dropzone.options.fbDropZone = { // The camelized version of the ID of the form element

        // The configuration we've talked about above
        autoProcessQueue: true,
        uploadMultiple: false,
        maxFiles: 1,
        addRemoveLinks: true,
        autoDiscover: false,
        dictDefaultMessage: "Drag and Drop Images Here or Click Me...",

        maxfilesexceeded: function(file) {
            this.removeAllFiles();
            this.addFile(file);
        },



        sending: function(file)
        {
          console.log('sending')
        },

        removedfile: function(file) {
            jQuery('form #edit_image img').remove();
            $.ajax({
                type: 'DELETE',
                url: '/articles/'+file.article_id+'/remove_image',
                success: function(data){
                    console.log(data.message);
                }
            });
            var _ref;
            return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
        },
        // The setting up of the dropzone
        init: function() {
            var myDropzone = this;

            // First change the button to actually tell Dropzone to process the queue.



            this.on("thumbnail", function(file) {
                console.log(file)
            });


            // Listen to the sendingmultiple event. In this case, it's the sendingmultiple event instead
            // of the sending event because uploadMultiple is set to true.
            this.on("sending", function() {
                console.log('sending');
                // Gets triggered when the form is actually being sent.
                // Hide the success button or the complete form.
            });
            this.on("success", function(file, response) {
                jQuery('form #edit_image img').remove();
                file.article_id = response.id;
                var source = response.image;
                var alt = response.image_file_name;
                var pos = alt.lastIndexOf(".");
                if (pos > 0) {
                    alt = alt.substring(0, pos);
                }
                file.article_name = alt;
                jQuery('form #edit_image').html("<img src=" + source + " alt=" + alt + " width = 100 height = 60>");
                console.log(response)
            });
            this.on("errormultiple", function(files, response) {
                console.log('failed');
                // Gets triggered when there was an error sending the files.
                // Maybe show form again, and notify user of error
            });
        }

    }
});