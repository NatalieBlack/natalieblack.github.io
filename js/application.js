// Some general UI pack related JS

$(window).on('load', function() {
    // Move some elements around when viewing from a "mobile" container
    updateContainer();
    $(window).resize(function() {
        updateContainer();
        showOrHideArt();
    });
    // Disable link click not scroll top
    $("a[href='#']").click(function() {
        return false
    });

    var galleryPage = document.querySelector('body#gallery_page')
    if(galleryPage) {
      var canvas = document.querySelector('canvas');
      var canvasDiv = document.querySelector('div.gallery_page');
      var canvasWidth = canvas.offsetWidth;
      var p = document.createElement('p');
      document.body.prepend(p);
      p.id = 'warning';
      p.style.display = 'none';
      p.innerText = "This piece is too large to view on your device";
      showOrHideArt(); 

      function showOrHideArt() {
          if(window.innerWidth <= canvasWidth){
            canvasDiv.style.display = 'none';
            p.style.display = 'block';
          } else {
            canvasDiv.style.display = '';
            p.style.display = 'none';
          }
      }   
    }
    

});

function updateContainer() {
    var $containerWidth = $(window).width();
    if ($containerWidth <= 767) {
        swapPlaces(".post-meta", ".post-container");
	moveDatetime(true);
    }
    else {
        swapPlaces(".post-container", ".post-meta");
	moveDatetime(false);
    }
}

function swapPlaces(currentlyBefore, currentlyAfter) {
    $(currentlyBefore).each(function() {
        var $sibling = $(this).siblings(currentlyAfter);
	$(this).insertAfter($sibling);
    });
}

function moveDatetime(underTitle) {
    if (underTitle == true) {
        $(".date-time").each(function() {
            var $title = $(this).closest(".row-fluid").find(".link");
            $(this).insertAfter($title);
        });
    }
    else {
	$(".date-time").each(function() {
	    var $firstItemInPostMeta = $(this).closest(".row-fluid").find(".post-meta").children().first();
	    $(this).insertBefore($firstItemInPostMeta);
	});
    }
}
