// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

const form = document.querySelector('form');
const input = document.querySelector('input');
const container = document.querySelector('.container');

const apiKey = '190001ea';
const method = 'GET';
const baseURL = 'http://www.omdbapi.com';
const path = '/?i=tt3896198';
const params = `&apikey=${apiKey}`;
const url = baseURL + path + params;

const httpOptions = {
	method: method
};

function turnResponseIntoObject(response) {
	return response.json();
}

function displayData(info) {
	console.log(info);
	const html = `
<img src='http://api.qrserver.com/v1/create-qr-code/?data=HelloWorld!&size=100x100' alt="">
    `;
	container.innerHTML = html;
}

function getMovie(term) {
	fetch(url + `&t=${term}`, httpOptions).then(turnResponseIntoObject).then(displayData);
}

// params || body in the front
form.addEventListener('submit', function(ev) {
	ev.preventDefault();
	getMovie(input.value);
});
