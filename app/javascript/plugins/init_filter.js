const query = event => {
	document.querySelector('#filter_query').value =
		event.currentTarget.dataset.value;
	document.querySelector('#submit-filter').click();
};

const initFilter = () => {
	document.querySelectorAll('.filter-btn').forEach(btn => {
		btn.addEventListener('click', query);
	});
};

export { initFilter };
