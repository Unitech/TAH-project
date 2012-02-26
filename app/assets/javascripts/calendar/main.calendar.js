
function ajax_update_availability(calEvent, action) {
    var data = {
	start : calEvent.start.toISOString(),
	end : calEvent.end.toISOString(),
	menu_id : calEvent.menu_id,
	id : calEvent.id
    }

    var url;

    if (action == 'delete')
	url = window.routes.availabilities.del;
    else if (action == 'create')
	url = window.routes.availabilities.create;
    else if (action == 'update')
	url = window.routes.availabilities.update;
    else
	throw 'Wrong argument passwed at ajax_update_availability';
    
    $.ajax({
	url : url,
	data : data,
	type : 'POST',
	success : function(data) {
	    // Update ID
	    if (action == 'create')
		calEvent.id = data.new_id;
	}
    });
}


$(document).ready(function() {
    var $calendar = $('#calendar');

    var test = $calendar.weekCalendar({
	
	displayOddEven:true,
	timeslotsPerHour : 2,
	allowCalEventOverlap : true,
	overlapEventsSeparate: true,
	firstDayOfWeek : 1,
	businessHours :{start: 10, end: 23, limitDisplay: true },
	daysToShow : 7,
	switchDisplay: {'1 day': 1, '3 next days': 3, 'work week': 5, 'full week': 7},	
	use24Hour : true,
	


	title: function(daysToShow) {
	    return daysToShow == 1 ? '%date%' : '%start% - %end%';
	},
	height : function($calendar) {
            return $(window).height() - $("h1").outerHeight() - 1;
	},


	eventResize : function(newEl, oldEl, el) {
	    ajax_update_availability(newEl, 'update');
	},
	eventDrop : function(newEl, oldEl, el) {
	    ajax_update_availability(newEl, 'update');
	},

	eventRender : function(calEvent, $event) {

	    if(calEvent.end.getTime() < new Date().getTime()) {
	    	$event.addClass("stripped");
		
	    	//$event.find(".time").css({"backgroundColor": "#999", "border":"1px solid #888"});
	    }
	    
	    for (var i = 0; i < alternate_color.length; i++) {
		
		if (alternate_color[i].index == calEvent.menu_id) {
		    $event.css("backgroundColor", alternate_color[i].color);
		}
	    }

	},
	eventNew : function(calEvent, $event) {
	    var $dialogContent = $("#event_edit_container");
	    resetForm($dialogContent);
	    var startField = $dialogContent.find("select[name='start']").val(calEvent.start);
	    var endField = $dialogContent.find("select[name='end']").val(calEvent.end);
	    var titleField = $dialogContent.find("select[name='title']");

	    $dialogContent.dialog({
		modal: true,
		title: "New Calendar Event",
		close: function() {
		    $dialogContent.dialog("destroy");
		    $dialogContent.hide();
		    $('#calendar').weekCalendar("removeUnsavedEvents");
		},
		buttons: {
		    save : function() {
			calEvent.id = -1;
			calEvent.start = new Date(startField.val());
			calEvent.end = new Date(endField.val());
			calEvent.menu_id = titleField.val();
			calEvent.title = $dialogContent.find("select option[value='" + calEvent.menu_id + "']").html();
			
			$calendar.weekCalendar("removeUnsavedEvents");
			$calendar.weekCalendar("updateEvent", calEvent);
			$dialogContent.dialog("close");

			ajax_update_availability(calEvent, 'create');
			
		    },
		    cancel : function() {
			$dialogContent.dialog("close");
		    }
		}
	    }).show();

	    $dialogContent.find(".date_holder").text($calendar.weekCalendar("formatDate", calEvent.start));
	    setupStartAndEndTimeFields(startField, endField, calEvent, $calendar.weekCalendar("getTimeslotTimes", calEvent.start));

	},
	eventClick : function(calEvent, $event) {
            if (calEvent.readOnly) {
	    	return;
            }

            var $dialogContent = $("#event_edit_container");
            resetForm($dialogContent);
            var startField = $dialogContent.find("select[name='start']").val(calEvent.start);
            var endField = $dialogContent.find("select[name='end']").val(calEvent.end);
            var titleField = $dialogContent.find("select[name='title']").val(calEvent.title);
            var bodyField = $dialogContent.find("textarea[name='body']");
            bodyField.val(calEvent.body);

            $dialogContent.dialog({
	    	modal: true,
	    	title: "Edit - " + calEvent.title,
	    	close: function() {
	    	    $dialogContent.dialog("destroy");
	    	    $dialogContent.hide();
	    	    $('#calendar').weekCalendar("removeUnsavedEvents");
	    	},
	    	buttons: {
	    	    save : function() {

	    		calEvent.start = new Date(startField.val());
	    		calEvent.end = new Date(endField.val());

			calEvent.menu_id = titleField.val();
			calEvent.title = $dialogContent.find("select option[value='" + calEvent.menu_id + "']").html();

	    		$calendar.weekCalendar("updateEvent", calEvent);
	    		$dialogContent.dialog("close");
			ajax_update_availability(calEvent, 'update');
	    	    },
	    	    "delete" : function() {
	    		$calendar.weekCalendar("removeEvent", calEvent.id);
			ajax_update_availability(calEvent, 'delete');
	    		$dialogContent.dialog("close");
	    	    },
	    	    cancel : function() {
	    		$dialogContent.dialog("close");
	    	    }
	    	}
            }).show();

            var startField = $dialogContent.find("select[name='start']").val(calEvent.start);
            var endField = $dialogContent.find("select[name='end']").val(calEvent.end);
            $dialogContent.find(".date_holder").text($calendar.weekCalendar("formatDate", calEvent.start));
            setupStartAndEndTimeFields(startField, endField, calEvent, $calendar.weekCalendar("getTimeslotTimes", calEvent.start));
            $(window).resize().resize(); //fixes a bug in modal overlay size ??

	},
	data:eventData
    });


    function resetForm($dialogContent) {
	$dialogContent.find("input").val("");
	$dialogContent.find("textarea").val("");
    }


    /*
     * Sets up the start and end time fields in the calendar event
     * form for editing based on the calendar event being edited
     */
    function setupStartAndEndTimeFields($startTimeField, $endTimeField, calEvent, timeslotTimes) {

	$startTimeField.empty();
	$endTimeField.empty();

	for (var i = 0; i < timeslotTimes.length; i++) {
            var startTime = timeslotTimes[i].start;
            var endTime = timeslotTimes[i].end;
            var startSelected = "";
            if (startTime.getTime() === calEvent.start.getTime()) {
		startSelected = "selected=\"selected\"";
            }
            var endSelected = "";
            if (endTime.getTime() === calEvent.end.getTime()) {
		endSelected = "selected=\"selected\"";
            }
            $startTimeField.append("<option value=\"" + startTime + "\" " + startSelected + ">" + timeslotTimes[i].startFormatted + "</option>");
            $endTimeField.append("<option value=\"" + endTime + "\" " + endSelected + ">" + timeslotTimes[i].endFormatted + "</option>");

            $timestampsOfOptions.start[timeslotTimes[i].startFormatted] = startTime.getTime();
            $timestampsOfOptions.end[timeslotTimes[i].endFormatted] = endTime.getTime();

	}
	$endTimeOptions = $endTimeField.find("option");
	$startTimeField.trigger("change");
    }

    var $endTimeField = $("select[name='end']");
    var $endTimeOptions = $endTimeField.find("option");
    var $timestampsOfOptions = {start:[],end:[]};

    //reduces the end time options to be only after the start time options.
    $("select[name='start']").change(function() {
	var startTime = $timestampsOfOptions.start[$(this).find(":selected").text()];
	var currentEndTime = $endTimeField.find("option:selected").val();
	$endTimeField.html(
            $endTimeOptions.filter(function() {
		return startTime < $timestampsOfOptions.end[$(this).text()];
            })
        );

	var endTimeSelected = false;
	$endTimeField.find("option").each(function() {
            if ($(this).val() === currentEndTime) {
		$(this).attr("selected", "selected");
		endTimeSelected = true;
		return false;
            }
	});

	if (!endTimeSelected) {
            //automatically select an end date 2 slots away.
            $endTimeField.find("option:eq(1)").attr("selected", "selected");
	}

    });

});

