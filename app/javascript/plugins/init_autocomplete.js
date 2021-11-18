import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('travel_departure_location');
  if (addressInput) {
    places({ container: addressInput });
  }
  const arrival_addressInput = document.getElementById('travel_arrival_location');
  if (arrival_addressInput) {
    places({ container: arrival_addressInput });
  }
};

export { initAutocomplete };
