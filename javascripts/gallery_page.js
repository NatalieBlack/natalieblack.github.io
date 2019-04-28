(document).ready(function(){
    var canvas = document.querySelector('div.gallery_page canvas');
    var canvasDiv = document.querySelector('div.gallery_page');
    var canvasWidth = canvas.offsetWidth;
    var p = document.createElement('p');
    document.body.prepend(p);
    p.id = 'warning';
    p.style.display = 'none';
    p.innerText = "This piece is too large to view on your device";

    $('.gallery_page').slick({
        dots: true,
        fade: true,
        speed: 250,
        arrows: true,
        draggable: false,
        swipe: false,
        focusOnSelect: false
    });

    showOrHideArt(); 

    window.onresize = function(e) {
      showOrHideArt();
    };

    function showOrHideArt() {
        if(window.innerWidth <= canvasWidth){
          canvasDiv.style.display = 'none';
          p.style.display = 'block';
        } else {
          canvasDiv.style.display = '';
          p.style.display = 'none';
        }
    }   
});

