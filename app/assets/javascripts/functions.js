
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

TAH.editDishInLine = function(el, id) {
    $this = $(el);
    
    $('.each-dish').each(function() {
	$(this).removeClass('selected-dish');
	var title = $(this).find('#edit-area').val();

	$(this).find('#each-hide').hide();
	
	if (title != undefined)
	    $(this).find('#edit-area').replaceWith('<span id="title-dish">' + title + '</span>');
    });
    
    $this.addClass('selected-dish');
    $this.find('#each-hide').show();
    var title = $this.find('#title-dish').html();
    $this.find('#title-dish').replaceWith('<input type="text" id="edit-area" value="' + title + '"/>');
};