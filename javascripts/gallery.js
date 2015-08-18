$(document).ready(function(){
    var gallery = $('.gallery')[0];
    var pieces = $('.gallery .portal');
    for (var i = pieces.length; i >= 0; i--) {
        gallery.appendChild(pieces[Math.random() * i | 0]);
    }


   //$('.portal').on('mouseover', function(){
   //  $(this).$('.overlay').show();
   //});

   //$('.portal').on('mouseoff', function(){
   //  $(this).$('.overlay').hide();
   //});
});
