function initMap(input, result_id) {    
    var myCoords = new google.maps.LatLng(input[0][0], input[0][1]);    
    var mapOptions = {
        center: myCoords,
        zoom: 12
    };    
    var map = new google.maps.Map(document.getElementById('result-map'), mapOptions);
    input.forEach(function(coord){
        var myCoords = new google.maps.LatLng(coord[0], coord[1]);
        console.log(myCoords);
        var marker = new google.maps.Marker({
            position: myCoords,
            map: map,
            icon: {
                url: "http://maps.google.com/mapfiles/ms/icons/green-dot.png"
              },
            url: '/results/'+result_id+'#result_'+coord[2]
        });
        let card = document.getElementById('result_'+coord[2]);
        let cardHeader = card.getElementsByClassName("card-header")[0]
        let initialColors = ["warning", "success", "danger"];
        let initial = ""
        initialColors.forEach(function(color){
                if (card.className.includes(color)){
                   initial = color;
                }
            });
        google.maps.event.addListener(marker, 'mouseover', function() {
            marker.setIcon("http://maps.google.com/mapfiles/ms/icons/blue-dot.png");
            card.classList.remove('border-'+initial);
            cardHeader.classList.remove('bg-'+initial);
            card.classList.add("border-info");
            cardHeader.classList.add('bg-info');
            }); 
        google.maps.event.addListener(marker, 'mouseout', function() {
            marker.setIcon("http://maps.google.com/mapfiles/ms/icons/green-dot.png");
            card.classList.remove("border-info");
            cardHeader.classList.remove('bg-info');
            card.classList.add('border-'+initial);
            cardHeader.classList.add('bg-'+initial);
            });
        google.maps.event.addListener(marker, 'click', function() {
            card.scrollIntoView(false)
            });
        card.addEventListener('mouseover', function() {
            marker.setIcon("http://maps.google.com/mapfiles/ms/icons/blue-dot.png");
            card.classList.remove('border-'+initial);
            cardHeader.classList.remove('bg-'+initial);
            card.classList.add("border-info");
            cardHeader.classList.add('bg-info');
            }); 
        card.addEventListener('mouseout', function() {
            marker.setIcon("http://maps.google.com/mapfiles/ms/icons/green-dot.png");
            card.classList.remove("border-info");
            cardHeader.classList.remove('bg-info');
            card.classList.add('border-'+initial);
            cardHeader.classList.add('bg-'+initial);
            });

    });

}

