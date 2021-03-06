<%@page import="com.Bean.CumulativeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>drop off location picker</title>
</head>
<body>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
        /* Always set the map height explicitly to define the size of the div
         * element that contains the map. */
        #map {
            height: 90%;
        }
        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        .controls {
            margin-top: 10px;
            border: 1px solid transparent;
            border-radius: 2px 0 0 2px;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            height: 32px;
            outline: none;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        }

        #origin-input,
        #destination-input {
            background-color: #fff;
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
            margin-left: 12px;
            padding: 0 11px 0 13px;
            text-overflow: ellipsis;
            width: 200px;
        }

        #origin-input:focus,
        #destination-input:focus {
            border-color: #4d90fe;
        }

        #mode-selector {
            color: #fff;
            background-color: #4d90fe;
            margin-left: 12px;
            padding: 5px 11px 0px 11px;
        }

        #mode-selector label {
            font-family: Roboto;
            font-size: 13px;
            font-weight: 300;
        }

    </style>
</head>
<body>
<%
	CumulativeBean cb=(CumulativeBean)session.getAttribute("object");
	String ttype=cb.getTname();
	String origin="";
	if(ttype.equals("amd-del"))
		origin="Delhi Railway Station,Mori Gate,New Delhi,Delhi,India";
	else if(ttype.equals("amd-mum"))
		origin="Mumbai Central,Mumbai,Maharashtra,India";
	else if(ttype.equals("amd-ban"))
		origin="Bangalore City Station,M.G. Railway Colony,Bengaluru,Karnataka,India";
	else if(ttype.equals("amd-hyd"))
		origin="Nampally Railway Station,Hyderabad,Telangana,India";
	session.setAttribute("originnext", origin);
%>
<form action="cumController2" method="post" onsubmit="display()">
<input id="origin-input" name="origin" class="controls" type="text" value="<%=origin %>"
       placeholder="Enter an origin location">

  <input id="destination-input"  name="destination" class="controls" type="text" value=""
       placeholder="Enter a destination location"> 
       <input type="hidden" id="org" name="org" value="<%=origin%>">
       <input type="hidden" id="dest" name="dest" value="">
<input type="submit" value="Confirm">
</form>

  <div id="mode-selector" class="controls">
<input type="radio" name="type" id="changemode-driving" >
    <label for="changemode-driving" class="controls">Driving</label> 
    </div> 




 
    
   

<div id="map"></div>

<script>
    // This example requires the Places library. Include the libraries=places
    // parameter when you first load the API. For example:
    // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
	function display()
    {
        var x=document.getElementById('origin-input').value;
        var y=document.getElementById('destination-input').value;
       	document.getElementById('org').value=x;
       	document.getElementById('dest').value=y;
		
        
    }
	
    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            mapTypeControl: false,
            center: {lat: 23.022, lng: 72.571},
            zoom: 13
        });

        new AutocompleteDirectionsHandler(map);
    }

    /**
     * @constructor
     */
    function AutocompleteDirectionsHandler(map) {
        this.map = map;
        this.originPlaceId = null;
        this.destinationPlaceId = null;
       this.travelMode = 'WALKING';
        var originInput = document.getElementById('origin-input');
        var destinationInput = document.getElementById('destination-input');
        var modeSelector = document.getElementById('mode-selector');
        this.directionsService = new google.maps.DirectionsService;
        this.directionsDisplay = new google.maps.DirectionsRenderer;
        this.directionsDisplay.setMap(map);

        var originAutocomplete = new google.maps.places.Autocomplete(
                originInput, {placeIdOnly: true});
        var destinationAutocomplete = new google.maps.places.Autocomplete(
                destinationInput, {placeIdOnly: true});

        
        this.setupClickListener('changemode-driving', 'DRIVING');

        this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
        this.setupPlaceChangedListener(destinationAutocomplete, 'DEST');

        this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(originInput);
        this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(destinationInput);
        this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(modeSelector);
    }

    // Sets a listener on a radio button to change the filter type on Places
    // Autocomplete.
    AutocompleteDirectionsHandler.prototype.setupClickListener = function(id, mode) {
        var radioButton = document.getElementById(id);
        var me = this;
        radioButton.addEventListener('click', function() {
            me.travelMode = mode;
            me.route();
        });
    };

    AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function(autocomplete, mode) {
        var me = this;
        autocomplete.bindTo('bounds', this.map);
        autocomplete.addListener('place_changed', function() {
            var place = autocomplete.getPlace();
            if (!place.place_id) {
                window.alert("Please select an option from the dropdown list.");
                return;
            }
            if (mode === 'ORIG') {
                me.originPlaceId = place.place_id;
            } else {
                me.destinationPlaceId = place.place_id;
            }
            me.route();
        });

    };

    AutocompleteDirectionsHandler.prototype.route = function() {
        if (!this.originPlaceId || !this.destinationPlaceId) {
            return;
        }
        var me = this;
        
        this.directionsService.route({
            origin: {'placeId': this.originPlaceId},
            destination: {'placeId': this.destinationPlaceId},
            travelMode: this.travelMode
        }, function(response, status) {
            if (status === 'OK') {
                me.directionsDisplay.setDirections(response);
            } else {
                window.alert('Directions request failed due to ' + status);
            }
        });
    };

</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTFv50q5YUvRzwBxl9Mp7-BEwibPYMr3Y&libraries=places&callback=initMap"
        async defer></script>


</body>
</html>