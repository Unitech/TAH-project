
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