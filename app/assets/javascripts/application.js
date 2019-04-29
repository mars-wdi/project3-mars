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
//= require_tree .
const handelRequest = e => {

    const favoriteId = e.target.parentElement.id;
    let fav = document.querySelector(`#favorite-${placeId}`).innerHTML;
    if (fav == true) {
        fav = false
    }
    else {
        fav = true
    }

    const url = `/places/${placeId}/favorite`;

    fetch(url, {
        method: "PUT",
        body: JSON.stringify({ place: { favorite: fav } }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(
        res => (document.querySelector(`#favorite-${placeId}`).innerHTML = fav)
    )
        .catch(error => console.error("Error:", error));
};

const favorites = document.querySelectorAll(".favorite");

favorites.forEach(favorite => {
    console.log('test');
    favorite.addEventListener("click", handelRequest);
});