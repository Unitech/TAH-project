
TAH = {};

/*
 * el_triggered == button to click
 * upload_trigger == upload field
 */
TAH.clickTriggerUpload = function(el_triggered, upload_trigger) {
    $(el_triggered).attr('title', 'Upload');
    $(el_triggered).click(function() {
	$(upload_trigger).trigger('click');
    });
    $(upload_trigger).change(function() {
	$('#trigger_upload_field').css({'opacity' : 0.2});
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