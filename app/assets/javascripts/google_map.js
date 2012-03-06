
GMAP = {};


GMAP.map_message = function(text, success) {
    if (success == undefined || success == false)
	$('#info-message').html('<span class="failure">' + text + '</span>');
    else
	$('#info-message').html('<span class="success">' + text + '</span>');
};

GMAP.validates_inputs = function(form) {
    if (form.address1.length == 0 ||
	form.city.length == 0 ||
	form.zipcode.length == 0) {
	GMAP.map_message(window.map_lang.accurate);
	return false;
    }
    return true;    
};

GMAP.validates_gmap_data = function(data) {
    if (data.Placemark == undefined ||
	data.Placemark.length > 1) {
	GMAP.map_message(window.map_lang.accurate);
	return false;
    }
    return true;        
};

function initialize_gmap() {

    var zoneCircle;
    var saved_lat = $('#google_map').attr('latitude');
    var saved_lng = $('#google_map').attr('longitude');
    var is_present;

    if (saved_lng != '' && saved_lat != '')
	is_present = true;
    else
	is_present = false;
    

    if (is_present) {
	var myOptions = {
	    zoom: 16,
	    center: new google.maps.LatLng(saved_lng, saved_lat),
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	}
    }
    else {
	var myOptions = {
	    zoom: 1,
	    center: new google.maps.LatLng(50, 0),
	    mapTypeId: google.maps.MapTypeId.ROADMAP	    
	}
    }
    
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

    if (is_present) {
	var zone = {
	    strokeColor: "#FF0000",
	    strokeOpacity: 0.8,
	    strokeWeight: 0,
	    fillColor: "#FF0000",
	    fillOpacity: 0.35,
	    map: map,
	    center: myOptions.center,
	    radius: 70
	};
	
	zoneCircle = new google.maps.Circle(zone);
    }
    
    
    var submit_btn = $('.address').find('.submit').hide();
    $('.address').find('input').each(function() {
	$(this).keyup(function() {
	    submit_btn.fadeOut();
	});
    });

    
    
    $('.address').submit(function(e) {
	e.preventDefault();

	GMAP.map_message('');
	var apiKey = 'AIzaSyC6eDspYVOXJaAIxLwq93QcVWFJUf_sXVc';

	var self = $(this);
	var form = $(this).serializeObject();

	if (GMAP.validates_inputs(form) == false)
	    return ;
	
	var address = form.address1 + ' ' + form.city + ' ' + form.zipcode + ' ' + form.country;

	var url = "http://maps.google.com/maps/geo?q=" + 
	    address+
	    "&key="
	    +apiKey+"&sensor=false&output=json&callback=?";
	


	$.getJSON(url, function(data, textStatus){
	    
	    // Remove old circle if present
	    if (zoneCircle != undefined) 
		zoneCircle.setMap(null);

	    if (GMAP.validates_gmap_data(data) == false)
		return;

	    var lat = data.Placemark[0].Point.coordinates[0];
	    var lng = data.Placemark[0].Point.coordinates[1];
	    var coordinates = new google.maps.LatLng(lng, lat);

	    form.latitude = lat;
	    form.longitude = lng;

	    var zone = {
		strokeColor: "#FF0000",
		strokeOpacity: 0.8,
		strokeWeight: 0,
		fillColor: "#FF0000",
		fillOpacity: 0.35,
		map: map,
		center: coordinates,
		radius: 70
	    };
	    
	    
	    map.setCenter(coordinates);

	    var zoom = 10;
	    (function smoothZoom() {
		map.setZoom(zoom);
		zoom++;
		if (zoom == 17)
		    return;
		setTimeout(smoothZoom, 160);
	    })();



	    zoneCircle = new google.maps.Circle(zone);
	    
	    self.find('.submit').fadeIn();
	    self.find('.submit').click(function() {

		var url_to_dispatch;

		if (is_present)
		    url_to_dispatch = window.routes.map.update;
		else
		    url_to_dispatch = window.routes.map.create;

		$.ajax({
		    type : 'POST',
		    url : url_to_dispatch,
		    data : form,
		    success : function() {
			GMAP.map_message(window.map_lang.success, true);
		    }
		});

	    });
	});
	
    });

}