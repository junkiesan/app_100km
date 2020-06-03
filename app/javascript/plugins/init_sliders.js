const initSliders = () => {
  const slider = document.querySelector('#trip_radius');

  slider.addEventListener('input',(event) =>{
    document.querySelector('.range-output').innerText = `${event.target.value}km`
    document.querySelector('.range-output').style.left = `calc(${event.target.value}%)`
    document.querySelector('.range-output').style.transform = `translate(-${25 + (event.target.value/10)}px)`
  })

};


export {initSliders};
