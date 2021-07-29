let map
let geocoder

function initMap(){
  
  geocoder = new google.maps.Geocoder();
  
  if(document.getElementById('map')){
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 35.6895014, lng: 139.6917337},
      zoom: 17
    });
  }else{
    map = new google.maps.Map(document.getElementById('show_map'), {
      center: {lat: gon.latitude, lng: gon.longitude},
      zoom: 17
    });
  
    marker = new google.maps.Marker({ 
      position: {lat: gon.latitude, lng: gon.longitude},
      map: map
    });
  }
}

function codeAddress(){

  let inputAddress = document.getElementById('address').value;


  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
　　　　　　　　　　　　
      map.setCenter(results[0].geometry.location);

　　　　　
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}