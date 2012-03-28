
TAH = {};


var reader = new FileReader();

TAH.previewImg = function(file_input_event, preview_img) {
	// acceptable file types
	var accept = ["image/png","image/jpeg","image/jpg","image/gif"];

	var files = file_input_event.target.files;
	// if we accept the file type
	if (accept.indexOf(files[0].type) > -1) {
		if (files && files[0]) {
			reader.onload = function() { preview_img.attr('src', this.result); };
			reader.readAsDataURL(files[0]);
		}
	}
};


TAH.clickTriggerUpload = function(preview_img, file_input) {
    preview_img.bind('attr', 'title', 'Upload');
    preview_img.bind('click', function() { file_input.trigger('click'); });
    file_input.bind('change', function(file_input_event) {
		preview_img.css({'opacity' : 0.2});
		TAH.previewImg(file_input_event, preview_img);
	});
};

/*
 * dish_dashboard/_dish_list.html.erb
 */
TAH.addDishAjax = function() {

    var ajax_notification = $('#ajax-error-message');

    $('#add-dish-ajax')
	.bind('ajax:before', function() {
		ajax_notification.html(images.spinner);
	})
	.bind('ajax:error', function(evt, xhr, status, error) {
	    var $form = $(this),
            errors,
            errorText;

	    try {
		errors = $.parseJSON(xhr.responseText);
	    } catch(err) {
		errors = {message: "Please reload the page and try again"};
	    }

	    errorText = "There were errors with the submission: \n<ul>";

	    for ( error in errors ) {
		errorText += "<li>" + error + ': ' + errors[error] + "</li> ";
	    }

	    errorText += "</ul>";
	    
	    ajax_notification.html(errorText);
	    
	}).bind('ajax:success', function(evt, data, status, xhr) {
    	    $('.dish-append').append(data.partial);
    	    $(this)[0].reset();
	    ajax_notification.html('');
	});
};

TAH.editDishInLine = function(id) {
};

/*
 * table_dashboard/edit_table.html.erb
 */

TAH.editTable = function() {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyC6eDspYVOXJaAIxLwq93QcVWFJUf_sXVc&sensor=false&callback=initialize_gmap";
    document.body.appendChild(script);

};

$.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
	var name = this.name.replace(/.*\[|\]/gi,'');
        if (o[name] !== undefined) {
            if (!o[name].push) {
                o[name] = [o[name]];
            }
            o[name].push(this.value || '');
        } else {
            o[name] = this.value || '';
        }
    });
    return o;
};