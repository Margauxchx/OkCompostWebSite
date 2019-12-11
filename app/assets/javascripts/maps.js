function initMap(coordinates) {    
    var myCoords = new google.maps.LatLng(coordinates[0][0], coordinates[0][1]);    
    var mapOptions = {
        center: myCoords,
        zoom: 12
    };    
    var map = new google.maps.Map(document.getElementById('result-map'), mapOptions);
    coordinates.forEach(function(coord){
        var myCoords = new google.maps.LatLng(coord[0], coord[1]);
        console.log(myCoords);
        var marker = new google.maps.Marker({
            position: myCoords,
            map: map,
            icon: {
                url: "http://maps.google.com/mapfiles/ms/icons/green-dot.png"
              }
        });
    });

}


