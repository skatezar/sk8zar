const setupGooglePlaces = () => {
  const inputs = document.querySelectorAll('.locationSearchInput');
  console.log(inputs)
  inputs.forEach((input) => {
    const initialize = () => {
      const options = {
        types: ["geocode"]
      };
      new google.maps.places.Autocomplete(input, options);
    }

    initialize();
  });
};

export {setupGooglePlaces}
