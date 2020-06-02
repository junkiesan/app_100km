const initSliders = () => {
  const slider = document.querySelector('#trip_radius');
  slider.addEventListener('input',(event) =>{
    document.querySelector('.range-output').innerText = `${event.target.value}km`
  })

};


export {initSliders};
