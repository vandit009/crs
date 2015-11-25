<!DOCTYPE html>
<%@page import="java.util.List"%>
<html>
<head>
<meta charset='utf-8' />
<link rel='stylesheet' href='fullcalendar.css' />
<script src='jquery-1.11.1.min.js'></script>
 
<script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />


<script src='moment.min.js'></script>
<script src='fullcalendar.js'></script>
<link href='scheduler.css' rel='stylesheet' />
<script src='scheduler.js'></script>
<script src='fullcalendar.min.js'></script>
												

<script>
	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			
			schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source',

			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'agendaWeek'
			},
			minTime: "07:00:00",
			maxTime: "21:00:00",
			defaultView: 'agendaWeek',
			defaultDate: '2015-02-12',
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
						

					<% List list=(List)session.getAttribute("search");
					int i;
					 System.out.println(list);
					  for(i=0;i<list.size();i++){ %>
					   
						  {
								title: '<%=list.get(i).toString() %>',
								start: '2015-02-12T10:30:00',
								end: '2015-02-12T12:30:00'
							},
						
					                         <%}%>
					                         
					                         <c:forEach items="${sessionScope.search}" var="j">
					 						
					 						</c:forEach>
					
			
				
				{
					id: 999,
					title: 'Repeating Event',
					start: '2015-02-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2015-02-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2015-02-11',
					end: '2015-02-13'
				},
				
				{
					title: 'Lunch',
					start: '2015-02-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2015-02-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2015-02-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2015-02-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2015-02-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2015-02-28'
				}
			],
			 eventClick:  function(event, jsEvent, view) {
			        //set the values and open the modal
			        $("#eventInfo").html(event.description);
		            $("#startTime").html(moment(event.start).format('MMM Do h:mm A'));
		            $("#endTime").html(moment(event.start).format('MMM Do h:mm A'));

			        $("#eventLink").attr('href', event.url);
			        $("#eventContent").dialog({ modal: true, title: event.title });
			    },
		});
	});

</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
	#popup {
    display: none;
}

</style>
</head>
<body>

	<div id='calendar'></div>
<div id="eventContent" title="Event Details">
 Start: <span id="startTime"></span><br>
    End: <span id="endTime"></span><br><br>
    <div id="eventInfo"></div>
       
    
    <p><strong><a id="eventLink" target="_blank"></a></strong></p>
</div>
</body>
</html>
