$(document).ready(function() {
    Dropzone.options.fbDropZone = { // The camelized version of the ID of the form element

        // The configuration we've talked about above
        autoProcessQueue: true,
        uploadMultiple: false,
        maxFiles: 1,
        addRemoveLinks: true,

        // The setting up of the dropzone
        init: function() {
            var myDropzone = this;

            // First change the button to actually tell Dropzone to process the queue.
            this.element.querySelector("button[type=submit]").addEventListener("click", function(e) {
                // Make sure that the form isn't actually being sent.
                e.preventDefault();
                e.stopPropagation();
                myDropzone.processQueue();
            });


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
            this.on("successmultiple", function(files, response) {
                console.log('Succeeded');
                // Gets triggered when the files have successfully been sent.
                // Redirect user or notify of success.
            });
            this.on("errormultiple", function(files, response) {
                console.log('failed');
                // Gets triggered when there was an error sending the files.
                // Maybe show form again, and notify user of error
            });
        }

    }
});