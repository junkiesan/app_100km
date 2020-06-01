const addActive = event => {
	const id = event.target.id.split('-')[1];
	const marker = document.querySelector(`#marker-${id}`);
	marker.classList.add('marker-active');
};

const bindAddVenue = btn => {
	btn.addEventListener('click', addActive);
};

const initAddMarker = () => {
	console.log('init add');
	document.querySelectorAll('.add-venue').forEach(bindAddVenue);
};

const removeActive = event => {
	const id = event.target.id.split('-')[1];
	const marker = document.querySelector(`#marker-${id}`);
	marker.classList.remove('marker-active');
};

const bindRemoveVenue = btn => {
	btn.addEventListener('click', removeActive);
};

const initRemoveMarker = () => {
	console.log('init remove');
	document.querySelectorAll('.remove-venue').forEach(bindRemoveVenue);
};
