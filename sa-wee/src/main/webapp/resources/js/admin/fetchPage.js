function fetchPage(name) {
	fetch(name).then(function(response) {
		response.text().then(function(text) {
			document.querySelector('div.table_mobile').innerHTML = text;
		})
	});
}

