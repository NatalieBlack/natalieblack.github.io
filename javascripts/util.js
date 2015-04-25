function consoleLog(message) {
        console.log(message);
} 
//$('canvas').width(jQuery(window).width() * 0.5);
//console.log($('canvas').offsetWidth);
//$('canvas').height(setupHeight);
function makeDiptych() {
    console.log('hi');
   w = $('.diptych').width(); 
   $('.diptychPanel').width(w * 0.4); 
}
window.addEventListener('load', function () {
  makeDiptych();
}, false);
$(window).load(function() {
    makeDiptych();
});
$(window).resize(function(){
    makeDiptych();
});
$(window).scroll(function() {
    makeDiptych();
});
