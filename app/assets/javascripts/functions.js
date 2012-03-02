
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
    $('#add-dish-ajax').submit(function(e) {
	
	$(this).bind('ajax:success', function() {

	    var data = "<li>" + $(this).find('#dish_title').val() + "</li>";
	    $('.dish-append').append(data);	    
	    $(this)[0].reset();

	});
	
	// Why?
	$(this).bind('ajax:failure', function() {
	    alert('Error fields');
	});
    });
};