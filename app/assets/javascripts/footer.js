$SIDEBAR_FOOTER.ready(function() {
  console.log('sidebar_footer initialized');
  var el = document.getElementById('fullscreen');
  var doc_el = document.getElementById('js-body');
  
  el.addEventListener('click',function(event){
    event.preventDefault();
    console.log('expanded!');

    if (doc_el.requestFullscreen) {
      doc_el.requestFullscreen();
    } else if (doc_el.webkitRequestFullscreen) {
      doc_el.webkitRequestFullscreen();
    } else if (doc_el.mozRequestFullScreen) {
      doc_el.mozRequestFullScreen();
    } else if (doc_el.msRequestFullscreen) {
      doc_el.msRequestFullscreen();
    }
  });
});